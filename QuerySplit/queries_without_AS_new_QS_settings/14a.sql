
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

SELECT MIN(movie_info_idx.info) AS rating,
       MIN(title.title) AS northern_dark_movie
FROM info_type,
     info_type,
     keyword,
     kind_type,
     movie_info,
     movie_info_idx,
     movie_keyword,
     title
WHERE info_type.info = 'countries'
  AND info_type.info = 'rating'
  AND keyword.keyword IN ('murder',
                    'murder-in-title',
                    'blood',
                    'violence')
  AND title.kind = 'movie'
  AND movie_info.info IN ('Sweden',
                  'Norway',
                  'Germany',
                  'Denmark',
                  'Swedish',
                  'Denish',
                  'Norwegian',
                  'German',
                  'USA',
                  'American')
  AND movie_info_idx.info < '8.5'
  AND title.production_year > 2010
  AND title.id = title.kind_id
  AND title.id = movie_info.movie_id
  AND title.id = movie_keyword.movie_id
  AND title.id = movie_info_idx.movie_id
  AND movie_keyword.movie_id = movie_info.movie_id
  AND movie_keyword.movie_id = movie_info_idx.movie_id
  AND movie_info.movie_id = movie_info_idx.movie_id
  AND keyword.id = movie_keyword.keyword_id
  AND info_type.id = movie_info.info_type_id
  AND info_type.id = movie_info_idx.info_type_id;
