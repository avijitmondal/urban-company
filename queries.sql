-- Select all entries from City table
select * from City;

-- Insert new city into City table
insert into `City` values (101,'Bangalore','Karnataka','India');
select * from City where id = 101;


-- Change city name from Bangalore to Mangalore
update City set name = 'Mangalore' where id = 101;
select * from City where id = 101;

-- Delete city from City table
delete from City where id = 101; 
select * from City where id = 101;
