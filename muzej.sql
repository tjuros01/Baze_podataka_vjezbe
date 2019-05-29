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

create table djeloIzlozba(
djelo int not null,
izlozba int not null
);

alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);
alter table djeloIzlozba add foreign key (djelo) references djelo(sifra);
alter table djeloIzlozba add foreign key (izlozba) references izlozba (sifra);


#dodavanje vrijednosti
insert into kustos (ime,prezime,ovlasten) values ('Ivan','Ivic',true),('Josip','Markovic',true),('Goran','Bare',true);
insert into sponzor(naziv,donacija) values ('Pepsi',900.00),('Mercedes',1900.00),('ATM', 2500.00);
insert into djelo (naziv) values ('kost glave T-rexa'),('Kosti necega');
insert into izlozba (naziv,kustos,sponzor) values ('Prva',1,2),('Druga',2,1),('Treca',3,3);
insert into djeloIzlozba (djelo,izlozba) values (1,1),(2,3),(2,2);
