switch to c_r;
switch to relationshipcenter;

set effective_cache_size to '8 GB';
set statement_timeout = '1000s';
SET max_parallel_workers = 0;
SET max_parallel_workers_per_gather = 0;
SET parallel_leader_participation = off;

SELECT MIN(keyword.keyword) AS movie_keyword,
       MIN(name.name) AS actor_name,
       MIN(title.title) AS hero_movie
FROM cast_info,
     keyword,
     movie_keyword,
     name,
     title
WHERE keyword.keyword IN ('superhero',
                    'sequel',
                    'second-part',
                    'marvel-comics',
                    'based-on-comic',
                    'tv-special',
                    'fight',
                    'violence')
  AND name.name LIKE '%Downey%Robert%'
  AND title.production_year > 2000
  AND keyword.id = movie_keyword.keyword_id
  AND title.id = movie_keyword.movie_id
  AND title.id = cast_info.movie_id
  AND cast_info.movie_id = movie_keyword.movie_id
  AND name.id = cast_info.person_id;

