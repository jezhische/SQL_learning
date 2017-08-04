-- http://java-online.ru/sql-join.xhtml

CREATE table if not exists users (
  id      int not null,
  name    varchar(32) not null,
  primary key (id)
);
-- Вставим в таблицу несколько записей
insert into users (id, name) values (1, 'alex' );
insert into users (id, name) values (2, 'piter');
insert into users (id, name) values (3, 'serg' );
insert into users (id, name) values (4, 'olga' );
insert into users (id, name) values (5, 'ostap');

alter table users 
add column timestamp_now timestamp default now();

alter table users
drop column if exists date_now;

delete from users where "name" = 'olga';

create index ix on users ("name", id);
drop index ix;


select * from users;
delete from users; 
delete from users where id = 2; 

CREATE table if not exists autos (
  id      int not null,         -- идентификатор авто
  name    varchar(32) not null, -- наименование авто
  oid     int not null,         -- идентификатор владельца
  constraint autos_pk primary key (id)
  );
drop table autos;
-- Вставим в таблицу несколько записей
insert into autos (id, oid, name) values (1, 1, 'toyota camry'  );
insert into autos (id, oid, name) values (2, 1, 'toyota prado'  );
insert into autos (id, oid, name) values (3, 2, 'renault megane');
insert into autos (id, oid, name) values (4, 3, 'nissan x-trail');
insert into autos (id, oid, name) values (5, 4, 'suzuki swift'  );
insert into autos (id, oid, name) values (6, 4, 'suzuki vitara' );

select * from autos;
select * from users;

-- INNER JOIN (пересечение таблиц - только соответствие)
select u.id, u."name" as owner, a."name" as auto 
	from users u 
	inner join autos a on u.id = a.oid;

-- LEFT OUTER JOIN (левая таблица целиком, правая - соответствия)
select u.id, u.name as owner, a.name as auto
  from users u 
  left join autos a ON a.oid = u.id;

-- RIGHT OUTER JOIN (правая таблица целиком, левая - соответствия)
select u.id, u."name" as owner, a."name" as auto 
	from users u 
	right outer join autos a on u.id = a."oid";
	
-- LEFT OUTER JOIN с фильтрацией
select u.id, u."name" as owner, a."name" as auto, a."oid" 
	from users u
	left join autos a on u.id = a."oid"
	where a."name" is null;
