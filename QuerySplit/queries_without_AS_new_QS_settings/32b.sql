
set shared_buffers = '512MB';
set temp_buffers = '2047MB';
set work_mem = '2047MB';
set default_statistics_target = 100;
switch to c_r;
switch to relationshipcenter;

set effective_cache_size to '8 GB';
set statement_timeout = '1000s';
SET max_parallel_workers = 0;
SET max_parallel_workers_per_gather = 0;
SET parallel_leader_participation = off;

SELECT MIN(link_type.link) AS link_type,
       MIN(title.title) AS first_movie,
       MIN(title.title) AS second_movie
FROM keyword,
     link_type,
     movie_keyword,
     movie_link,
     title
WHERE keyword.keyword ='character-name-in-title'
  AND movie_keyword.keyword_id = keyword.id
  AND title.id = movie_keyword.movie_id
  AND movie_link.movie_id = title.id
  AND movie_link.linked_movie_id = title.id
  AND link_type.id = movie_link.link_type_id
  AND movie_keyword.movie_id = title.id;

