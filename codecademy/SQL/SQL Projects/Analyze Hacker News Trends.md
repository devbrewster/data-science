# Analyze Hacker News Trends

#### Start by getting a feel for the `hacker_news` table!
#### Let's find the most popular Hacker News stories:

    SELECT title, score
    FROM hacker_news
    ORDER BY score DESC
    LIMIT 5;

#### What are the top five stories with the highest scores?
![image](https://user-images.githubusercontent.com/40252813/180627762-22b95030-9eed-47d7-97f4-da393c85f6c5.png)


#### Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).
#### Is this true of Hacker News?
#### Is a small percentage of Hacker News submitters taking the majority of the points?
#### First, find the total score of all the stories.

    SELECT SUM(score)
    FROM hacker_news;
![image](https://user-images.githubusercontent.com/40252813/180627859-7e671ee8-fd66-4b2b-a9b3-0eb85f440854.png)

#### Next, we need to pinpoint the users who have accumulated a lot of points across their stories.
#### Find the individual users who have gotten combined scores of more than 200, and their combined scores.
#### GROUP BY and HAVING are needed!

    SELECT user, SUM(score)
    FROM hacker_news
    GROUP BY user
    HAVING SUM(score) > 200
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180627953-70e81e95-c206-49b6-ad3c-300b21e95a78.png)

#### Then, we want to add these users’ scores together and divide by the total to get the percentage.
#### Add their scores together and divide it by the total sum. Like so:
`SELECT (1.0 + 2.0 + 3.0) / 6.0;`
#### So, is Hacker News dominated by these users? `~22%`
    
    SELECT (517 + 309 + 304 + 282) / 6366.0;
![image](https://user-images.githubusercontent.com/40252813/180628076-d42a4d28-fca4-4828-a825-7edc81027f2e.png)

#### Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding.
#### The url of the video is: https://www.youtube.com/watch?v=dQw4w9WgXcQ
#### How many times has each offending user posted this link?

    SELECT user, COUNT(*)
    FROM hacker_news
    WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
    GROUP BY 1
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180628191-c9b356d6-6d3f-44a5-a1d5-5a8d6c255b71.png)

#### Hacker News stories are essentially links that take users to other websites.
#### Which of these sites feed Hacker News the most: GitHub, Medium, or New York Times?
#### First, we want to categorize each story based on their source.
#### We can do this using a CASE statement:

    SELECT CASE
      WHEN url LIKE '%github.com%' THEN 'GitHub'
      WHEN url LIKE '%medium.com%' THEN 'Medium'
      WHEN url LIKE '%github.com%' THEN 'New York Times'
      ELSE 'Other'
    END AS 'Source'
    FROM hacker_news;
![image](https://user-images.githubusercontent.com/40252813/180628372-eb725b23-3fa9-4b76-8c62-e19c91bf174a.png)

#### Next, build on the previous query:
#### Add a column for the number of stories from each URL using COUNT().
#### Also, GROUP BY the CASE statement.
#### Remember that you can refer to a column in GROUP BY using a number.

    SELECT CASE
      WHEN url LIKE '%github.com%' THEN 'GitHub'
      WHEN url LIKE '%medium.com%' THEN 'Medium'
      WHEN url LIKE '%github.com%' THEN 'New York Times'
      ELSE 'Other'
      END AS 'Source',
      COUNT(*)
    FROM hacker_news
    GROUP BY 1;
![image](https://user-images.githubusercontent.com/40252813/180628466-9a9ab8c3-900d-410c-82f1-70e1e96e29e7.png)

#### Every submitter wants their story to get a high score so that the story makes it to the front page, but…
#### What’s the best time of the day to post a story on Hacker News?
#### Before we get started, let’s run this query and take a look at the timestamp column:

    SELECT timestamp
    FROM hacker_news
    LIMIT 10;
![image](https://user-images.githubusercontent.com/40252813/180628764-ef141125-8042-4096-847f-b7a02e005609.png)

#### Notice that the values are formatted like:
`2018-05-08T12:30:00Z`

#### If you ignore the T and Z, the format is:
`YYYY-MM-DD HH:MM:SS`

#### SQLite comes with a `strftime()` function - a very powerful function that allows you to return a formatted date.
#### It takes two arguments:
`strftime(format, column)`
#### Let’s test this function out:

    SELECT timestamp,
       strftime('%H', timestamp)
    FROM hacker_news
    GROUP BY 1
    LIMIT 20;
![image](https://user-images.githubusercontent.com/40252813/180628674-34f761b8-36e3-498e-8bc8-ff431245edb6.png)

    For strftime(__, timestamp):

    %Y returns the year (YYYY)
    %m returns the month (01-12)
    %d returns the day of the month (1-31)
    %H returns 24-hour clock (00-23)
    %M returns the minute (00-59)
    %S returns the seconds (00-59)


#### What do you think this does? Open the hint if you’d like to learn more.
#### This returns the hour, `HH`, of the `timestamp` column!

#### Let’s edit a few things in the previous query:
- Round the average scores (ROUND()).
- Rename the columns to make it more readable (AS).
- Add a WHERE clause to filter out the NULL values in timestamp.
#### Take a look at the result again:
#### What are the best hours to post a story on Hacker News? `1800` or `6PM` and `7AM`

    SELECT strftime('%H', timestamp) AS 'Time of Day (Hour)', 
      ROUND(AVG(score), 0) AS 'Average Score of Stories', 
      COUNT(*) AS 'Number of Stories'
    FROM hacker_news
    WHERE timestamp IS NOT NULL
    GROUP BY 1
    ORDER BY 2 DESC;
![image](https://user-images.githubusercontent.com/40252813/180629089-c1e14f9e-87bf-4e57-a131-8a5354af95ae.png)
