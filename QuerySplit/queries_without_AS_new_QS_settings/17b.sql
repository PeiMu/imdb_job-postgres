
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

SELECT MIN(name.name) AS member_in_charnamed_movie,
       MIN(name.name) AS a1
FROM cast_info,
     company_name,
     keyword,
     movie_companies,
     movie_keyword,
     name,
     title
WHERE keyword.keyword ='character-name-in-title'
  AND name.name LIKE 'Z%'
  AND name.id = cast_info.person_id
  AND cast_info.movie_id = title.id
  AND title.id = movie_keyword.movie_id
  AND movie_keyword.keyword_id = keyword.id
  AND title.id = movie_companies.movie_id
  AND movie_companies.company_id = company_name.id
  AND cast_info.movie_id = movie_companies.movie_id
  AND cast_info.movie_id = movie_keyword.movie_id
  AND movie_companies.movie_id = movie_keyword.movie_id;

