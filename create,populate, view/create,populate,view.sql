CREATE table if not exists "public".users
(
    id serial primary key,
    name varchar(255),
    password varchar(255)
   )
   
CREATE table if not exists public.fishing_place
(
    id integer NOT NULL,
    coordinates character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    place_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    river_flow character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_id integer,
    CONSTRAINT fishing_place_pkey PRIMARY KEY (id),
    CONSTRAINT fkjra00pb164scwiwsj4oq7bqgu FOREIGN KEY (user_id)
        REFERENCES public."USER" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
 
CREATE table if not exists public.fish
(
    id serial primary key,
    name character varying(255)
)


   
   
insert into "USER" ("name", "password") values ('petya', 'true');
insert into "USER" ("id", "name", "password") values (789, 'vasya', 'false');
select * from "USER";
  



drop table users;