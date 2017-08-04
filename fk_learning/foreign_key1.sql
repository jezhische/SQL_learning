create table if not exists public."USER" (
	id integer not null,
	name varchar(128) not null,
	password varchar(255) not null,
	constraint "user_pk" primary key(id)
);
alter table public."USER" owner to postgres;

create table if not exists public.fishing_place (
	id integer not null,
	name varchar(128) not null,
	place_type varchar(55) not null,
	river_flow varchar(55) not null,
	coordinates varchar(128) null,
	user_id integer not null,
	constraint fp_id primary key(id),
	constraint fkUser_id foreign key(user_id)
	references public."USER" (id) match simple
		on update cascade
		on delete cascade
);
alter table public.fishing_place owner to postgres;


select * from "USER";
select * from fishing_place;
select * from fish;
select * from fishing_place_fish;
insert into "USER" ("id", "name", "password") values (1234567, 'petya', 'true');
insert into "USER" ("id", "name", "password") values (789, 'vasya', 'false');
select * from "USER";
insert into fishing_place (id, "name", place_type, river_flow, coordinates, user_id) values (103, 'vorscla', 'RIVER', 'FAST', null, 1234567);
insert into fishing_place (id, "name", place_type, river_flow, coordinates, user_id) values (105, 'pechenegi', 'RESERVOIR', 'NO', '456.0, 123.78', 789);
insert into fishing_place (id, "name", place_type, river_flow, coordinates, user_id) values (107, 'donets', 'RIVER', 'MEDIUM', '615.6415, 645.25', 1234567);
update fishing_place set user_id = 789 where "id" = 105;
update fishing_place set user_id = 1234567 where "id" = 103;
update fishing_place set user_id = 1234567 where "id" = 107;
select * from fishing_place;
select * from fishing_place fp where fp.user_id in (
select u."id"  from "USER" u where u."name" = 'petya' and u."password" = 'true');
select fp."user_id" from fishing_place fp where fp.river_flow = 'FAST';
delete from "USER" u where u.id in (select fp."user_id" from fishing_place fp where fp.river_flow = 'FAST');
delete from "USER" u where u."password" = 'true' and u."name" = 'petya';
select * from "USER";
delete from "USER" u where u.id = 1234567;
select * from fishing_place;
select * from fishing_place fp where fp.user_id in (select u."id"  from "USER" u where u."name" = 'petya' and u."password" = 'true');
select * from "USER";
delete from fishing_place fp where fp.user_id = 789;
select * from "USER";
select * from fishing_place;
drop table "USER" cascade;
drop table fishing_place cascade;
select * from "USER";
select * from fishing_place;
