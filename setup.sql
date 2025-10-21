/*/ use accountadmin role /*/
use role accountadmin;
--create DB , schema, warehouse
create database if not exists Genai_db;
create schema if not exists Genai_db.data;
create warehouse if not exists gen_ai_wh;

--- Download the data file from git repo or kaggle--
-- upload the data into Genai_db.data.imdb_movies using snowsight
-- Create cortex search services and analyst in snowsight

SELECT
  *
FROM
  "GENAI_DB"."DATA"."IMDB_MOVIES"
LIMIT
  10;


CREATE OR REPLACE CORTEX SEARCH SERVICE genai_db.data.imdb_svc
  ON overview
  ATTRIBUTES names,genre
  WAREHOUSE = ml_fs_W
  TARGET_LAG = '100 days'
 -- EMBEDDING_MODEL = 'snowflake-arctic-embed-l-v2.0'
AS (
  SELECT
      *
  FROM "GENAI_DB"."DATA"."IMDB_MOVIES"
);


CREATE OR REPLACE CORTEX SEARCH SERVICE genai_db.data.actor_svc
  ON crew
  ATTRIBUTES names,genre
  WAREHOUSE = ml_fs_W
  TARGET_LAG = '100 days'

AS (
  SELECT
      *
  FROM "GENAI_DB"."DATA"."IMDB_MOVIES"
);

