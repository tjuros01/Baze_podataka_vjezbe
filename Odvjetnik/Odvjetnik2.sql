# izvođenje
# Ova datoteka se nalazi na X:\
/*

c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "X:\Odvjetnik2.sql"

*/


drop database if exists Odvjetnik2;
create database Odvjetnik2 default character set utf8;
use Odvjetnik2;

create table odvjetnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11),
polog decimal(18,2)
);

create table klijent(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null
);

create table suradnik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
zvanje varchar(50),
polog decimal(18,2)
);

create table obrana(
sifra int not null primary key auto_increment,
odvjetnik int not null,
klijent int not null
);

create table suradnikobrana(
suradnik int not null,
obrana int not null
);