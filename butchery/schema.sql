drop table if exists users;
drop table if exists teams;
drop table if exists challenges;
drop table if exists patches;
drop table if exists exploits;
drop table if exists flags;

create table users (
  id integer primary key autoincrement,
  name text unique not null,
  username text unique not null,
  password text not null
);

create table teams (
  id integer primary key autoincrement,
  name text unique not null,
  ip text unique not null,
  enabled boolean default 1
);

create table challenges (
  id integer primary key autoincrement,
  name text not null,
  port integer not null
);

create table patches (
  id integer primary key autoincrement,
  name text,
  version text not null,
  description text not null,
  path text unique not null,
  timestamp datetime not null default current_timestamp,

  user_id integer not null,
  challenge_id integer not null
);

create table exploits (
  id integer primary key autoincrement,
  version text not null,
  command text not null,
  path text unique not null,
  timestamp datetime not null default current_timestamp,
  enabled boolean not null default 1,

  user_id integer not null,
  challenge_id integer not null
);

create table flags (
  id integer primary key autoincrement,
  flag text not null,
  submitted boolean not null default 0,
  timestamp datetime not null default current_timestamp,

  exploit_id integer not null,
  team_id integer not null
);

insert into users ( name, username, password ) values ( 'FriendlyName', 'LoginUsername', 'pbkdf2:sha256:150000$XXXXXXXXXXXXX0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' );