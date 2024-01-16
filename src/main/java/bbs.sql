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

alter table bbs
    add foreign key (id) references member (id);

############## update
update bbs
set step = step + 1
where ref = (select ref from (select ref from bbs a where seq = ?) A)
and step >  (select step from (select step from bbs b where seq = ?) B);
############## insert
insert into bbs (id, ref, step, depth, title, content, wdate, del, readcount)
values (?,
        (select ref from bbs a where seq=?),
        (select step from bbs b where seq=?) + 1,
        (select depth from bbs c where seq=?) + 1,
        ?, ?, now(), 0, 0);