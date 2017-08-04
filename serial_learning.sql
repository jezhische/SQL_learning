CREATE table if not exists public."USER"
(
    id serial primary key,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL
   )
TABLESPACE pg_default;

ALTER TABLE public."USER"
    OWNER to postgres;
    
insert into "USER" ("name", "password") values ('petya', 'true');
insert into "USER" ("id", "name", "password") values (789, 'vasya', 'false');
select * from "USER";
  



drop table "USER";
    
    
CREATE TABLE IF NOT EXISTS "category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(30) DEFAULT NULL
);
drop table category;