/*

c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "X:\NBA.sql"

*/

drop database if exists nba;
create database nba;
use nba;

create table player(
player_id int not null primary key auto_increment,
FirstName varchar(50) not null,
LastName varchar(50) not null, 
Position varchar (20),
Height_cm int,
Salary decimal(18,2) 
);

create table team(
team_id int not null primary key auto_increment,
Name varchar(50) not null,
Location varchar(50) not null
);

create table coach(
coach_id int not null primary key auto_increment,
FirstName varchar(50) not null,
LastName varchar(50) not null,
HeadCoach int not null 
);

create table game(
game_id int not null primary key auto_increment,
GameDate datetime,
Location varchar(50) not null,
Hometeam int not null,
Awayteam int not null

);

create table stats(
stats_id int not null primary key auto_increment,
Points int,
Assists int,
Rebunds int,
Blocks int,
Min_played int,
player int not null,
game int not null
);

create table player_team(
player int not null,
team int not null
);

create table player_coach(
coach int not null,
team int not null
);



alter table player_team add foreign key (player) references player(player_id);
alter table player_team add foreign key (team) references team(team_id);
alter table player_coach add foreign key (coach) references coach(coach_id);
alter table player_coach add foreign key (team) references team(team_id);
alter table game add foreign key (Hometeam) references team(team_id);
alter table game add foreign key (Awayteam) references team(team_id);
alter table coach add foreign key (HeadCoach) references coach(coach_id);
alter table stats add foreign key (player) references player(player_id);
alter table stats add foreign key (game) references game(game_id);