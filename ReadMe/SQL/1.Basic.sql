create database test;
use test;
create table testTable(
	test_column int
);

alter table testTable add col2 varchar(255); 
 
 create table band(
	id int not null auto_increment,
	name varchar(255) not null,
    primary key(id)
 ); 
 
create table albums(
 id int not null auto_increment,
 name varchar(255) not null,
 release_year int,
 band_id int not null,
 primary key(id),
 foreign key(band_id) references band(id)
);


insert into band (name) values ('bandA'),('bandB'),('bandC') ;
select * from band ;
select * from band limit 2;
select name from band limit 1;
select id as 'ID' , name as 'band id' from band;
select * from band order by name desc;

insert into albums (name,release_year,band_id)
values ('abc',1999,1),
	   ('deded',2020,1),
       ('deddas',2008,2),
       ('deded',2010,3);

select * from albums;
select name from albums;
select distinct name from albums;
update albums set release_year = 1989 where id = 1;
select * from albums;
select * from albums where release_year < 2010;
select * from albums where name like '%ded%';
select * from albums where name like '%das%' or release_year > 2010;
select * from albums where release_year between 2000 and 2020;
delete from albums where id = 3;
select * from albums;

select * from band join albums on band.id = albums.band_id;

select avg(release_year) from albums;
 
select band_id, count(band_id) from albums group by band_id;