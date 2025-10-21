/*/ use accountadmin role /*/
use role accountadmin;
--create DB , schema, warehouse
create database if not exists Genai_db;
create schema if not exists Genai_db.data;
create warehouse if not exists gen_ai_wh;
