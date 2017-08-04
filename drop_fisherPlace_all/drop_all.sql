drop table if exists "public".fishing_place_fish cascade;
drop table if exists "public".fishing_place cascade;
drop table if exists "public".fish cascade;
drop table if exists "public"."USER" cascade;

-- drop database if exists postgres;

CREATE DATABASE postgres
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    

