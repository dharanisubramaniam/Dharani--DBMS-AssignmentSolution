create database bus;
use bus;

create table PASSENGER(Passenger_name varchar(50),Category varchar(50),Gender varchar(35),Boarding_city varchar(55),Destination_city 
varchar(50),Distance int,Bus_type varchar(55));
drop table price;
create table PRICE(Bus_type varchar(55),Distance int,Price int);

insert into passenger values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert into passenger values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert into passenger values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert into passenger values('Kushboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert into passenger values('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
insert into passenger values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert into passenger values('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
insert into passenger values('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
insert into passenger values('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into price values('Sleeper',350,770);
insert into price values('Sleeper',500,1100);
insert into price values('Sleeper',600,1320);
insert into price values('Sleeper',700,1540);
insert into price values('Sleeper',1000,2200);
insert into price values('Sleeper',1200,2640);
insert into price values('Sleeper',1500,2700);
insert into price values('Sitting',500,620);
insert into price values('Sitting',600,744);
insert into price values('Sitting',700,868);
insert into price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
insert into price values('Sitting',1500,1860);

select * from passenger;

select * from price;

truncate table passenger;

select Gender,count(Gender) from passenger where distance>600 group by Gender;

select min(price) from price where Bus_type='Sleeper';


select passenger_name from passenger where passenger_name like 'S%';


select pa.passenger_name,pa.boarding_city,pa.destination_city,pd.price from passenger pa
inner join passenger_details pd on pa.bus_type=pd.bus_type and pa.distance=pd.distance;



select pa.passenger_name,pd.price from passenger pa,passenger_details pd where 
pa.distance=(select distance from passenger_details where distance=1000 group by bus_type having bus_type='Sitting') and
pa.bus_type=(select bus_type from passenger_details where distance=1000 group by bus_type having bus_type='Sitting');

select price as 'SittingPrice' from passenger_details pd where distance=(select distance from passenger pa where
passenger_name='pallavi') and bus_type='Sitting';

select price as 'SleeperPrice' from passenger_details pd where distance=(select distance from passenger pa where 
passenger_name='pallavi') and bus_type='Sleeper';


select distance from passenger group by distance order by distance desc;

select passenger_name,distance*100/sum(distance) over() 'percentage %' from passenger;


select pd.distance,pd.price,
case
when pd.price>=1000 then 'Expensive'
when pd.price>=500 and pd.price<1000 then 'Average Cost'
when pd.price<500 then 'Cheap'
end as category
from passenger_details pd group by pd.distance,pd.price;