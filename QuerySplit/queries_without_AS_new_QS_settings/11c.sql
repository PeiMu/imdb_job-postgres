
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

SELECT MIN(company_name.name) AS from_company,
       MIN(movie_companies.note) AS production_note,
       MIN(title.title) AS movie_based_on_book
FROM company_name,
     company_type,
     keyword,
     link_type,
     movie_companies,
     movie_keyword,
     movie_link,
     title
WHERE company_name.country_code !='[pl]'
  AND (company_name.name LIKE '20th Century Fox%'
       OR company_name.name LIKE 'Twentieth Century Fox%')
  AND company_type.kind != 'production companies'
  AND company_type.kind IS NOT NULL
  AND keyword.keyword IN ('sequel',
                    'revenge',
                    'based-on-novel')
  AND movie_companies.note IS NOT NULL
  AND title.production_year > 1950
  AND link_type.id = movie_link.link_type_id
  AND movie_link.movie_id = title.id
  AND title.id = movie_keyword.movie_id
  AND movie_keyword.keyword_id = keyword.id
  AND title.id = movie_companies.movie_id
  AND movie_companies.company_type_id = company_type.id
  AND movie_companies.company_id = company_name.id
  AND movie_link.movie_id = movie_keyword.movie_id
  AND movie_link.movie_id = movie_companies.movie_id
  AND movie_keyword.movie_id = movie_companies.movie_id;

