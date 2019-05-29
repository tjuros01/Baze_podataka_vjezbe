# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "X:\muzej.sql"

drop database if exists muzej;
create database muzej;
use muzej;

create table kustos(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11),
ovlasten boolean not null
);

create table sponzor(
sifra int not null primary key auto_increment,
naziv varchar(50),
donacija decimal (18,2)
);

create table djelo(
sifra int not null primary key auto_increment,
naziv varchar(50) not null
);


create table izlozba(
sifra int not null primary key auto_increment,
naziv varchar(50) not null,
kustos int not null,
sponzor int not null
);
