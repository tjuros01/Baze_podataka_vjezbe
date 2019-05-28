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

# POVEZIVANJE VANJSKIH KLJUČEVA

alter table obrana add foreign key (odvjetnik) references odvjetnik(sifra);
alter table obrana add foreign key (klijent) references klijent(sifra);

alter table suradnikobrana add foreign key (obrana) references obrana(sifra);
alter table suradnikobrana add foreign key (suradnik) references suradnik(sifra);




# NAREDBA INSERT


insert into odvjetnik (ime,prezime,polog) values ('Ivan','Ivanković',1000.00),('Marko','Marković',899.00),('Davor','Dominiković',1200.00);

insert into klijent (ime, prezime) values ('Marko','Radonić'),('Ivan','Ninković'),('Šimun','Lakušić');

insert into suradnik (ime,prezime,zvanje,polog) values ('Dino','Čar','upravni referent',500.00),('Josip','Čurić','odvjetnik',450.00),
('Zvonimir','Dmjehal','pomoćnik odvjetnika',650.00),
('Mirko','Marko','referent',400.00);

insert into obrana(odvjetnik,klijent) values (1,1),(2,3),(3,3),(2,2);
insert into suradnikobrana(suradnik,obrana) values (1,1), (2,2), (3,3), (4,4);


# NAREDBE SELECT I DELETE - VJEŽBE

select * from odvjetnik;
update odvjetnik set prezime='Orešković' where sifra=3;
alter table odvjetnik add column iban varchar(32);
update odvjetnik set iban='HR7523400096573698967' where sifra=2;
insert into odvjetnik (ime,prezime,polog) values ('Ivo','Sanader','629.00');
delete from odvjetnik where sifra=4;
select * from odvjetnik;

select 'Gotovo';