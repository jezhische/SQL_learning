create table if not exists months 
(id int not null primary key, name varchar(10) not null, day int);
alter table public.months 
owner to postgres;

