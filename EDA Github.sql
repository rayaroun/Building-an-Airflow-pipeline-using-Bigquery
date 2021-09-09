###################################################################################################################################################


SELECT 
  type,
  COUNT(*) AS cnt
FROM `githubarchive.day.20181201` 
GROUP BY 1
ORDER BY 2 DESC


Result - 

[
  {
    "type": "PushEvent",
    "cnt": "588724"
  },
  {
    "type": "CreateEvent",
    "cnt": "155010"
  },
  {
    "type": "WatchEvent",
    "cnt": "67607"
  },
  {
    "type": "PullRequestEvent",
    "cnt": "56635"
  },
  {
    "type": "IssueCommentEvent",
    "cnt": "46972"
  },
  {
    "type": "IssuesEvent",
    "cnt": "27592"
  },
  {
    "type": "ForkEvent",
    "cnt": "24331"
  },
  {
    "type": "DeleteEvent",
    "cnt": "22590"
  },
  {
    "type": "PullRequestReviewCommentEvent",
    "cnt": "9756"
  },
  {
    "type": "MemberEvent",
    "cnt": "5201"
  },
  {
    "type": "GollumEvent",
    "cnt": "4445"
  },
  {
    "type": "ReleaseEvent",
    "cnt": "3527"
  },
  {
    "type": "CommitCommentEvent",
    "cnt": "1759"
  },
  {
    "type": "PublicEvent",
    "cnt": "1064"
  }
]



###################################################################################################################################################



SELECT 
  repo.name,
  COUNT(*) AS cnt
FROM `githubarchive.day.20181201`
WHERE type IN ( 'IssueCommentEvent')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


Result - 

[
  {
    "name": "google-test/signcla-probe-repo",
    "cnt": "327"
  },
  {
    "name": "Azure/azure-rest-api-specs",
    "cnt": "287"
  },
  {
    "name": "kubernetes/kubernetes",
    "cnt": "227"
  },
  {
    "name": "rust-lang/rust",
    "cnt": "207"
  },
  {
    "name": "apache/spark",
    "cnt": "204"
  },
  {
    "name": "freeCodeCamp/freeCodeCamp",
    "cnt": "196"
  },
  {
    "name": "everypolitician/everypolitician-data",
    "cnt": "192"
  },
  {
    "name": "TeamNewPipe/NewPipe",
    "cnt": "158"
  },
  {
    "name": "openshift/origin",
    "cnt": "140"
  },
  {
    "name": "NixOS/nixpkgs",
    "cnt": "126"
  }
]


###################################################################################################################################################




SELECT 
  repo.name,
  SUM(IF(type='WatchEvent', 1, NULL)) AS stars,
  SUM(IF(type='ForkEvent',  1, NULL)) AS forks,
  COUNT(*) AS cnt
FROM `githubarchive.day.20181201`
WHERE type IN ('WatchEvent','ForkEvent')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


Results - 


[
  {
    "name": "BcRikko/NES.css",
    "stars": "386",
    "forks": "35",
    "cnt": "421"
  },
  {
    "name": "leisurelicht/wtfpython-cn",
    "stars": "241",
    "forks": "31",
    "cnt": "272"
  },
  {
    "name": "satwikkansal/wtfpython",
    "stars": "190",
    "forks": "30",
    "cnt": "220"
  },
  {
    "name": "cssanimation/css-animation-101",
    "stars": "178",
    "forks": "5",
    "cnt": "183"
  },
  {
    "name": "firecracker-microvm/firecracker",
    "stars": "150",
    "forks": "13",
    "cnt": "163"
  },
  {
    "name": "withspectrum/spectrum",
    "stars": "132",
    "forks": "9",
    "cnt": "141"
  },
  {
    "name": "crazyandcoder/kindle_free_books",
    "stars": "132",
    "forks": "31",
    "cnt": "163"
  },
  {
    "name": "afshinea/stanford-cs-230-deep-learning",
    "stars": "120",
    "forks": "17",
    "cnt": "137"
  },
  {
    "name": "algorithm-visualizer/algorithm-visualizer",
    "stars": "119",
    "forks": "15",
    "cnt": "134"
  },
  {
    "name": "olifolkerd/tabulator",
    "stars": "114",
    "forks": "3",
    "cnt": "117"
  }
]


###################################################################################################################################################


