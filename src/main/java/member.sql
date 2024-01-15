create table member
(
    id    varchar(50) primary key,
    pw    varchar(50) not null,
    name  varchar(50) not null,
    email varchar(50) unique,
    auth  int
);