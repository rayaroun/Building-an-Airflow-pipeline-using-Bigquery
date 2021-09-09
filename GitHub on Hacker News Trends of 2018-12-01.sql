-- combination of both the tables
-- anaqlysis of github on hackernews 



WITH github_activity AS (
SELECT   
  repo.name as repo,
  CONCAT('https://github.com/', repo.name) as url,
  SUM(IF(type='WatchEvent', 1, NULL)) AS stars,
  SUM(IF(type='ForkEvent',  1, NULL)) AS forks,
  COUNT(*) AS cnt
FROM `githubarchive.day.20181201`
WHERE type IN ('WatchEvent','ForkEvent')
GROUP BY 1,2
),
hacker_news AS (
SELECT
  EXTRACT(DATE FROM timestamp) as date,
  `by` AS submitter,
  id as story_id,
  REGEXP_EXTRACT(url, "(https?://github.com/[^/]*/[^/#?]*)") as url,
  SUM(score) as score
FROM
  `bigquery-public-data.hacker_news.full`
WHERE
  type = 'story'
  AND EXTRACT(DATE FROM timestamp)='2018-12-01' 
  AND url LIKE '%https://github.com%'
  AND url NOT LIKE '%github.com/blog/%'
GROUP BY 1,2,3,4
)

SELECT
  a.date as date,
  a.url as github_url,
  b.repo as github_repo,
  a.score as hn_score,
  a.story_id as hn_story_id,
  b.stars as stars,
  b.forks as forks
FROM hacker_news as a
LEFT JOIN github_activity as b
ON a.url=b.url
ORDER BY hn_score DESC
LIMIT 10



Result - 

[
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/ithinco/i-am-chinese-the-dragonfly-must-go-on",
    "github_repo": "ithinco/i-am-chinese-the-dragonfly-must-go-on",
    "hn_score": "129",
    "hn_story_id": "18574181",
    "stars": "60",
    "forks": "1"
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/YugaByte/yugabyte-db",
    "github_repo": "YugaByte/yugabyte-db",
    "hn_score": "115",
    "hn_story_id": "18576170",
    "stars": "2",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/oxplot/pdftilecut",
    "github_repo": "oxplot/pdftilecut",
    "hn_score": "64",
    "hn_story_id": "18575094",
    "stars": "91",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/alertlogic/erllambda",
    "github_repo": "alertlogic/erllambda",
    "hn_score": "64",
    "hn_story_id": "18574683",
    "stars": "48",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/chocolatey/boxstarter",
    "github_repo": "chocolatey/boxstarter",
    "hn_score": "9",
    "hn_story_id": "18575802",
    "stars": "1",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/devsnek/engine262",
    "github_repo": "devsnek/engine262",
    "hn_score": "8",
    "hn_story_id": "18577658",
    "stars": "1",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/anmonteiro/aws-lambda-ocaml-runtime",
    "github_repo": "anmonteiro/aws-lambda-ocaml-runtime",
    "hn_score": "4",
    "hn_story_id": "18578964",
    "stars": "5",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/jerverless/jerverless",
    "github_repo": null,
    "hn_score": "4",
    "hn_story_id": "18577036",
    "stars": null,
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/andrewchaa/functional.pipe",
    "github_repo": "andrewchaa/functional.pipe",
    "hn_score": "4",
    "hn_story_id": "18574107",
    "stars": "2",
    "forks": null
  },
  {
    "date": "2018-12-01",
    "github_url": "https://github.com/KumarAbhirup/bulk-mail-cli",
    "github_repo": null,
    "hn_score": "4",
    "hn_story_id": "18577887",
    "stars": null,
    "forks": null
  }
]



