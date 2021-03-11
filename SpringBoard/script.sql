
-- SpringBoard > script.sql

create table tblSpringBoard (
    seq number primary key,
    id varchar2(30) not null, 
    subject varchar2(1000) not null,
    content varchar2(2000) not null,
    regdate date default sysdate not null
);

create sequence seqSpringBoard;

insert into tblSpringBoard (seq, id, subject, content, regdate) values (seqSpringBoard.nextVal, 'hong', '게시판입니다.', '내용입니다.', default);

select * from tblSpringBoard;

commit;






