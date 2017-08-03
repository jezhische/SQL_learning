select * from public.months order by name desc;
select * from months m where "name" = 'january';
select * from months where "name" = 'january' and "day" <= 18;
select "day" from months where "name" between 'february' and 'january';
select "name" from months where "name" in ('march', 'april');
select * from months where "name" like '%ru%';
select max(id) from months;
select "name", avg("day") from months group by id order by "name" desc;
select "name", id from months where "day" = (select min("day") from months);

select * from fishing_place;