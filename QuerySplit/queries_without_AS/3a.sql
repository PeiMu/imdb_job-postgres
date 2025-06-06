set effective_cache_size to '8 GB';
set statement_timeout = '1000s';

SET max_parallel_workers = 0;
SET max_parallel_workers_per_gather = 0;
SET parallel_leader_participation = off;

SELECT MIN(title.title) AS movie_title
FROM keyword,
     movie_info,
     movie_keyword,
     title
WHERE keyword.keyword LIKE '%sequel%'
  AND movie_info.info IN ('Sweden',
                  'Norway',
                  'Germany',
                  'Denmark',
                  'Swedish',
                  'Denish',
                  'Norwegian',
                  'German')
  AND title.production_year > 2005
  AND title.id = movie_info.movie_id
  AND title.id = movie_keyword.movie_id
  AND movie_keyword.movie_id = movie_info.movie_id
  AND keyword.id = movie_keyword.keyword_id;

