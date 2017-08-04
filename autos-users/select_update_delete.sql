select u.id, u."name" as owner, a."name" as auto, a."oid"
from users u
left join autos a
on a."name" = 'toyota camry'
where a."oid" = 1;

delete from users u
where u."name" = 'alex';
select * from users;

delete from users u
where u.id in
(select a."oid" from autos a where a."name" = 'toyota prado'); 
select * from users;