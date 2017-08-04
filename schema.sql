CREATE TABLE public."USER"
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "USER_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."USER"
    OWNER to postgres;


CREATE TABLE public.fish
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fish_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.fish
    OWNER to postgres;


CREATE TABLE public.fishing_place
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
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.fishing_place
    OWNER to postgres;


CREATE TABLE public.fishing_place_fish
(
    fishing_place_id integer NOT NULL,
    fish_id integer NOT NULL,
    CONSTRAINT fishing_place_fish_pkey PRIMARY KEY (fishing_place_id, fish_id),
    CONSTRAINT fk3lbd35syx4iegw26igv0s30x7 FOREIGN KEY (fish_id)
        REFERENCES public.fish (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkgasv06vcbbwhwkn0o3042eh3g FOREIGN KEY (fishing_place_id)
        REFERENCES public.fishing_place (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.fishing_place_fish
    OWNER to postgres;

