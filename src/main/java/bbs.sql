create table bbs
(
    seq       int auto_increment primary key,
    id        varchar(50)   not null,

    ref       decimal(8)    not null,
    step      decimal(8)    not null,
    depth     decimal(8)    not null,

    title     varchar(50)   not null,
    content   varchar(4000) not null,
    wdate     timestamp     not null,

del       decimal(1)    not null,
readcount decimal(8)    not null
);

alter table bbs add foreign key(id) references member(id);