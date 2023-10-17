## Retrieving the comprehensive count of likes, comments, and shares garnered by a specific post identified by its unique post ID
```sql
SELECT
    p.post_id,
    p.post_content,
    COUNT(CASE WHEN ur.reaction_type = 'like' THEN 1 END) AS num_likes,
    COUNT(CASE WHEN ur.reaction_type = 'comment' THEN 1 END) AS num_comments,
    COUNT(CASE WHEN ur.reaction_type = 'share' THEN 1 END) AS num_shares
FROM
    Posts p
LEFT JOIN
    UserReactions ur ON p.post_id = ur.post_id
WHERE
    p.post_id = 2 -- Replace with the desired post_id
GROUP BY
    p.post_id, p.post_content;
```

**explaination**:
The query retrieves information about a specific post by counting the number of likes, comments, and shares it has received. It combines data from the Posts table, which holds post details, with the UserReactions table, where user reactions are stored. The counts for each type of reaction are calculated using conditional statements and then grouped together for the given post. The result shows the post’s ID, content, and the counts of likes, comments, and shares it has received, helping to understand the engagement it has generated.

## Calculating the mean number of reactions, encompassing likes, comments, and shares, per distinct user within a designated time period
```sql
SELECT
    DATE(ur.reaction_date) AS reaction_day,
    COUNT(DISTINCT ur.user_id) AS distinct_users,
    COUNT(*) AS total_reactions,
    AVG(COUNT(*)) OVER (PARTITION BY DATE(ur.reaction_date)) AS avg_reactions_per_user
FROM
    UserReactions ur
WHERE
    ur.reaction_date BETWEEN '2023-08-25' AND '2023-08-31' -- Replace with desired time period
GROUP BY
    reaction_day;
```

**explaination**:
The above query analyzes user reactions within a specific period by grouping the reactions based on the day they occurred. It calculates the number of distinct users who reacted each day, the total count of reactions on each day, and the average number of reactions per user for each day. It helps understand how engaged users were during that period, with the option to replace “2023-08-25” and “2023-08-31” with the desired start and end dates for the analysis

## Identifying the three most engaging posts, measured by the aggregate sum of reactions, within the preceding week

SELECT
    p.post_id,
    p.post_content,
    SUM(CASE WHEN ur.reaction_type = 'like' THEN 1 ELSE 0 END +
        CASE WHEN ur.reaction_type = 'comment' THEN 1 ELSE 0 END +
        CASE WHEN ur.reaction_type = 'share' THEN 1 ELSE 0 END) AS total_reactions
FROM
    Posts p
LEFT JOIN
    UserReactions ur ON p.post_id = ur.post_id
WHERE
    ur.reaction_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 WEEK) AND NOW()
GROUP BY
    p.post_id, p.post_content
ORDER BY
    total_reactions DESC
LIMIT
    3; -- Retrieve the top 3 most engaging posts

**explaination**:
The above query examines the engagement levels of posts within the last week by calculating the total number of reactions (likes, comments, and shares) each post has received. It combines data from the Posts table, which stores post details, with the UserReactions table, which holds information about user reactions. The reactions are grouped by post and summed up to determine the total engagement for each post. 
