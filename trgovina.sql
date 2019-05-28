# izvođenje
# Ova datoteka se nalazi na X:\
/*

c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "X:\trgovina.sql"

*/

drop database if exists trgovina;
create database trgovina;
use trgovina;

create table racun(
sifra int not null primary key auto_increment,
datum datetime default now()
);

create table proizvod(
sifra int not null primary key auto_increment,
naziv varchar(50),
cijena decimal(18,2)
);

create table stavka(
racun int not null,
proizvod int not null,
kolicina decimal(18,2) not null
);

alter table stavka add foreign key (racun) references racun(sifra);
alter table stavka add foreign key (proizvod) references proizvod(sifra);

insert into proizvod (naziv,cijena) values ('monitor',899.00), ('tablet',1499.00), ('slušalice',99.00);
insert into racun (datum) values ('2019-05-05');
insert into stavka (racun, proizvod) values (1,1);

select * from proizvod;
select * from stavka;
select * from racun;

alter table racun add column porez decimal (18,2);

update racun set porez=rand()*100;

insert into proizvod (naziv,cijena) values ('zvucnik',799.00);


select 'gotova_vjezba';
