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
kolicina decimal(18,3) not null
);

alter table stavka add foreign key (racun) references racun(sifra);
alter table stavka add foreign key (proizvod) references proizvod(sifra);