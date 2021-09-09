-- EDA of Hackenews dataset 


###################################################################################################################################################



SELECT 
  REGEXP_EXTRACT(url, '//([^/]*)/?') as domain,
  AVG(score) as avg_score,
  COUNT(*) AS cnt
FROM `bigquery-public-data.hacker_news.full`
WHERE url!='' 
AND EXTRACT(DATE FROM timestamp)="2018-12-01"
GROUP BY 1
ORDER BY 3 DESC 
LIMIT 10


Result - 

[
  {
    "domain": "github.com",
    "avg_score": "14.966666666666665",
    "cnt": "30"
  },
  {
    "domain": "medium.com",
    "avg_score": "15.592592592592595",
    "cnt": "27"
  },
  {
    "domain": "www.youtube.com",
    "avg_score": "12.666666666666668",
    "cnt": "24"
  },
  {
    "domain": "www.nytimes.com",
    "avg_score": "41.26315789473684",
    "cnt": "19"
  },
  {
    "domain": "venturebeat.com",
    "avg_score": "2.0999999999999996",
    "cnt": "10"
  },
  {
    "domain": "www.reddit.com",
    "avg_score": "21.428571428571427",
    "cnt": "7"
  },
  {
    "domain": "arstechnica.com",
    "avg_score": "22.666666666666668",
    "cnt": "6"
  },
  {
    "domain": "www.theguardian.com",
    "avg_score": "31.166666666666668",
    "cnt": "6"
  },
  {
    "domain": "en.wikipedia.org",
    "avg_score": "15.833333333333334",
    "cnt": "6"
  },
  {
    "domain": "www.wired.com",
    "avg_score": "32.6",
    "cnt": "5"
  }
]



###################################################################################################################################################


SELECT 
  REGEXP_EXTRACT(url, '//([^/]*)/?') as domain,
  COUNTIF(score>40) as score_gt_40,
  COUNT(*) AS cnt
FROM `bigquery-public-data.hacker_news.full`
WHERE url!='' 
AND EXTRACT(DATE FROM timestamp)="2018-12-01"
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10




Result - 

[
  {
    "domain": "github.com",
    "score_gt_40": "4",
    "cnt": "30"
  },
  {
    "domain": "www.nytimes.com",
    "score_gt_40": "4",
    "cnt": "19"
  },
  {
    "domain": "medium.com",
    "score_gt_40": "3",
    "cnt": "27"
  },
  {
    "domain": "www.youtube.com",
    "score_gt_40": "2",
    "cnt": "24"
  },
  {
    "domain": "www.theatlantic.com",
    "score_gt_40": "2",
    "cnt": "5"
  },
  {
    "domain": "www.wsj.com",
    "score_gt_40": "2",
    "cnt": "4"
  },
  {
    "domain": "en.wikipedia.org",
    "score_gt_40": "1",
    "cnt": "6"
  },
  {
    "domain": "www.ucdavis.edu",
    "score_gt_40": "1",
    "cnt": "1"
  },
  {
    "domain": "www.newsshooter.com",
    "score_gt_40": "1",
    "cnt": "1"
  },
  {
    "domain": "redditblog.com",
    "score_gt_40": "1",
    "cnt": "1"
  }
]



###################################################################################################################################################



SELECT     
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
GROUP BY  
  submitter,
  story_id,
  url
ORDER BY score DESC



Result - 

[
  {
    "submitter": "ithinco",
    "story_id": "18574181",
    "url": "https://github.com/ithinco/i-am-chinese-the-dragonfly-must-go-on",
    "score": "129"
  },
  {
    "submitter": "mountainview",
    "story_id": "18576170",
    "url": "https://github.com/YugaByte/yugabyte-db",
    "score": "115"
  },
  {
    "submitter": "oxplot",
    "story_id": "18575094",
    "url": "https://github.com/oxplot/pdftilecut",
    "score": "64"
  },
  {
    "submitter": "codeadict",
    "story_id": "18574683",
    "url": "https://github.com/alertlogic/erllambda",
    "score": "64"
  },
  {
    "submitter": "pjmlp",
    "story_id": "18575802",
    "url": "https://github.com/chocolatey/boxstarter",
    "score": "9"
  },
  {
    "submitter": "snek",
    "story_id": "18577658",
    "url": "https://github.com/devsnek/engine262",
    "score": "8"
  },
  {
    "submitter": "anmonteiro90",
    "story_id": "18578964",
    "url": "https://github.com/anmonteiro/aws-lambda-ocaml-runtime",
    "score": "4"
  },
  {
    "submitter": "andrewchaa",
    "story_id": "18574107",
    "url": "https://github.com/andrewchaa/functional.pipe",
    "score": "4"
  },
  {
    "submitter": "delvincasper",
    "story_id": "18577036",
    "url": "https://github.com/jerverless/jerverless",
    "score": "4"
  },
  {
    "submitter": "KumarAbhirup",
    "story_id": "18577887",
    "url": "https://github.com/KumarAbhirup/bulk-mail-cli",
    "score": "4"
  },
  {
    "submitter": "glassworm",
    "story_id": "18578992",
    "url": "https://github.com/benji6/andromeda",
    "score": "3"
  },
  {
    "submitter": "alexpate",
    "story_id": "18577256",
    "url": "https://github.com/alexpate/design-system-talks",
    "score": "3"
  },
  {
    "submitter": "daviesliu",
    "story_id": "18577033",
    "url": "https://github.com/juicedata/juicesync",
    "score": "3"
  },
  {
    "submitter": "psych0der",
    "story_id": "18575026",
    "url": "https://github.com/psych0der/HourGlass",
    "score": "3"
  },
  {
    "submitter": "Bogdanp",
    "story_id": "18575654",
    "url": "https://github.com/Bogdanp/awesome-advent-of-code",
    "score": "3"
  },
  {
    "submitter": "s32x",
    "story_id": "18579057",
    "url": "https://github.com/s32x/ipdata",
    "score": "3"
  },
  {
    "submitter": "ivank",
    "story_id": "18578481",
    "url": "https://github.com/darkreader/darkreader",
    "score": "3"
  },
  {
    "submitter": "tarboreus",
    "story_id": "18578264",
    "url": "https://github.com/jeffbinder/sentence-level-markov",
    "score": "2"
  },
  {
    "submitter": "amirouche",
    "story_id": "18574145",
    "url": "https://github.com/kamranahmedse/developer-roadmap",
    "score": "2"
  },
  {
    "submitter": "rootVIII",
    "story_id": "18579757",
    "url": "https://github.com/rootVIII/crypto_csv_writer",
    "score": "2"
  },
  {
    "submitter": "tosh",
    "story_id": "18578312",
    "url": "https://github.com/HCADatalab/IClojure",
    "score": "2"
  },
  {
    "submitter": "bttf",
    "story_id": "18577820",
    "url": "https://github.com/bttf/punch-clock-app",
    "score": "2"
  },
  {
    "submitter": "ArtWomb",
    "story_id": "18574435",
    "url": "https://github.com/jeeliz/jeelizWeboji",
    "score": "2"
  },
  {
    "submitter": "Tomte",
    "story_id": "18575775",
    "url": "https://github.com/nothings/stb",
    "score": "2"
  },
  {
    "submitter": "phkahler",
    "story_id": "18578352",
    "url": "https://github.com/phkahler/mellori_ITX",
    "score": "2"
  },
  {
    "submitter": "kturner",
    "story_id": "18577484",
    "url": "https://github.com/keith-turner/JSG",
    "score": "2"
  },
  {
    "submitter": "revskill",
    "story_id": "18574872",
    "url": "https://github.com/revskill10/next-routes-middleware",
    "score": "2"
  },
  {
    "submitter": "ousmanedev",
    "story_id": "18576064",
    "url": "https://github.com/ousmanedev/oma-ruby",
    "score": "1"
  },
  {
    "submitter": "s32x",
    "story_id": "18579061",
    "url": "https://github.com/s32x/gvrename",
    "score": "1"
  },
  {
    "submitter": "coffemood",
    "story_id": "18574674",
    "url": "https://github.com/coffeemood/config-butler",
    "score": "1"
  }
]


