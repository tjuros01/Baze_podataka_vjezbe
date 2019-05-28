# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "X:\samostan.sql"

drop database if exists samostan;
create database samostan;
use samostan;


create table svecenik(
sifra int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
oib char(11),
naredeni int not null
);


create table posao(
sifra int not null primary key auto_increment,
naziv varchar(50)
);


create table posaoSvecenika(
svecenik int not null,
posao int not null
);

alter table svecenik add foreign key (naredeni) references svecenik(sifra);
alter table posaoSvecenika add foreign key (svecenik) references svecenik(sifra);
alter table posaoSvecenika add foreign key (posao) references posao(sifra);
