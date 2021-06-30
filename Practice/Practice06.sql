--------------------- 테이블 삭제
drop table book;
drop table author;

drop sequence seq_author_id;
drop sequence seq_book_id;
---------------------------------
--------------------- 테이블 확인
select  *
from author;
select *
from book;
---------------------------------


--author 테이블 생성
create table author(
    author_id number(5),
    author_name varchar2(10),
    author_desc varchar2(50),
    primary key(author_id)
);

--seq_author_id 시퀀스 생성
create sequence seq_author_id
increment by 1
start with 1
nocache;

--author 테이블 데이터 저장
insert into author values(seq_author_id.nextval, '김문열', '경북 영양');
insert into author values(seq_author_id.nextval, '박경리', '경상남도 통영');
insert into author values(seq_author_id.nextval, '유시민', '17대 국회의원');
insert into author values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
insert into author values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
insert into author values(seq_author_id.nextval, '김영하', '알쓸신잡');


--book 테이블 생성
create table book(
    book_id number(5),
    title varchar2(50),
    pubs varchar2(50),
    pub_date date,
    author_id number(5),
    primary key(book_id),
    constraint book_fk foreign key(author_id) 
    references author(author_id)
);

--seq_book_id 시퀀스 생성
create sequence seq_book_id
increment by 1
start with 1
nocache;

--book 테이블 데이터 저장
insert into book values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림','1998-02-22', 1);
insert into book values(seq_book_id.nextval, '삼국지', '민음사','2002-03-01', 1);
insert into book values(seq_book_id.nextval, '토지', '마로니에북스','2012-08-15', 2);
insert into book values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길','2015-04-01', 3);
insert into book values(seq_book_id.nextval, '패션왕', '중앙북스(books)','2012-02-22', 4);
insert into book values(seq_book_id.nextval, '순정만화', '재미주의','2011-08-03', 5);
insert into book values(seq_book_id.nextval, '오직두사람', '문학동네','2017-05-04', 6);
insert into book values(seq_book_id.nextval, '26년', '재미주의','2012-02-04', 5);

--조인
select  b.book_id,
        b.title,
        b.pubs,
        to_char(b.pub_date, 'yyyy-mm-dd'),
        a.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id;

--정보변경
update author
set author_desc = '서울특별시'
where author_id = 5;

--데이터 삭제 --> 오류
delete from author
where author_id = 4;

--커밋
commit;