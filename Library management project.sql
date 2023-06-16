create database LibraryManagement;

use Librarymanagement;

## Create Tables For Book Publisher
create table Publisher (
	publisher_name varchar(200) not null primary key,
	publisher_address varchar(200) not null,
	publisher_phone int not null
);

## Create Table for Book information
create table table_book(
	book_id int primary key not null auto_increment,
	book_title varchar(200) not null,
	book_publisher_name varchar(200) not null,
	foreign key (book_publisher_name) 
	references Publisher(publisher_name) on update cascade on delete cascade
);
 
 ## Create Table for Library Baranch 
 create table library_branch( 
	 library_branch_id int not null primary key auto_increment,
	 library_name varchar(200) not null,
	 library_address varchar(200) not null
 );
 
## Create Table for book borrower
create table borrower(
	borrower_card_id int not null primary key auto_increment,
	borrower_name varchar(200) not null,
	borrower_address varchar(200) not null,
	borrower_phone int not null
);

Alter table borrower auto_increment=100;

## create table for book loan
create table book_loan(
	loan_id int not null auto_increment primary key,
	loan_book_id int not null, 
	loan_branch_id int not null,
	loan_card_number int not null,
	loan_date_out varchar(50) not null,
	loan_Due_date  varchar(50),
	foreign key(loan_book_id) references table_book(book_id) on update cascade on delete cascade,
	foreign key(loan_branch_id) references library_branch(library_branch_id) on update cascade on delete cascade,
	foreign key(loan_card_number) references borrower(borrower_card_id) on update cascade on delete cascade
);

## Create Table for book copies
create table book_copies(
	book_copies_id int not null primary key auto_increment,
	book_copies_book_id int not null,
	book_copies_branch_id int not null,
	book_copies_no_of_copies int not null,
	foreign key (book_copies_book_id) references table_book(book_id) on update cascade on delete cascade,
	foreign key (book_copies_branch_id) references library_branch(library_branch_id) on update cascade on delete cascade
);

## create table for book authors
create table author(
	author_id int not null primary key auto_increment,
	author_book_id  int not null,
	author_name varchar(200) not null,
	foreign key (author_book_id) references table_book(book_id) on update cascade on delete cascade
);

show tables;

## Insert data into tables
insert into publisher ( publisher_name, publisher_address, publisher_phone)
values 
	('DAW Books','375 Hudson Street, New York, NY 10014',21262000),
	('Viking','375 Hudson Street, New York, NY 10014',21232000),
	('Signet Books','375 Hudson Street, New York, NY 10014',21662000),
	('Chilton Books','Not Available',21211000),
	('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia',6128100),
	('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019',21294090),		
	('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018',21295300),
	('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyyoda-ku, Tokyo 101-0064 Japan',8157507),
	('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007',21277000),
	('Pan Books','175 Fifth Avenue, New York, NY 10010',64675745),
	('Chalto & Windus','375 Hudson Street, New York, NY 10014',216000),
	('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016',21205800),
	('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110',21245500),
	('Scholastic','557 Broadway, New York, NY 10012',80072527),
	('Bantam','375 Hudson Street, New York, NY 10014',21236000),
	('Picador USA','175 Fifth Avenue, New York, NY 10010',64675745)	
;

insert into table_book(book_title, book_publisher_name)
values
	('The Name of the Wind', 'DAW Books'),
	('It', 'Viking'),
	('The Green Mile', 'Signet Books'),
	('Dune', 'Chilton Books'),
	('The Hobbit', 'George Allen & Unwin'),
	('Eragon', 'Alfred A. Knopf'),
	('A Wise Mans Fear', 'DAW Books'),
	('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
	('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
	('The Giving Tree', 'Harper and Row'),
	('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
	('Brave New World', 'Chalto & Windus'),
	('The Princess Bride', 'Harcourt Brace Jovanovich'),
	('Fight Club', 'W.W. Norton'),
	('Holes', 'Scholastic'),
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
	('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
	('The Fellowship of the Ring', 'George Allen & Unwin'),
	('A Game of Thrones', 'Bantam'),
	('The Lost Tribe', 'Picador USA')
;

select * from table_book where book_title="Holes";

insert into library_branch(library_name, library_address)
values
	('Sharpstown','32 Corner Road, New York, NY 10012'),
	('Central','491 3rd Street, New York, NY 10014'),
	('Saline','40 State Street, Saline, MI 48176'),
	('Ann Arbor','101 South University, Ann Arbor, MI 48104')
;

insert into borrower(borrower_name, borrower_address, borrower_phone)
values 
	('Joe Smith','1321 4th Street, New York, NY 10014',2123121234),
	('Jane Smith','1321 4th Street, New York, NY 10014',2129314124),
	('Tom Li','981 Main Street, Ann Arbor, MI 48104',349027455),
	('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104',313591122),
	('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104',412512522),
	('Tom Haverford','23 75th Street, New York, NY 10014',212631418),
	('Haley Jackson','231 52nd Avenue New York, NY 10014',212199935),
	('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104',734998513)
;

insert into book_loan(loan_book_id, loan_branch_id, loan_card_number, loan_date_out, loan_due_date)
values
	('1','1','116','1/1/18','2/2/18'),
	('2','1','117','1/1/18','2/2/18'),
	('3','1','118','1/1/18','2/2/18'),
	('4','1','119','1/1/18','2/2/18'),
	('5','1','116','1/3/18','2/3/18'),
	('6','1','117','1/3/18','2/3/18'),
	('7','1','118','1/3/18','2/3/18'),
	('8','1','119','1/3/18','2/3/18'),
	('9','1','120','1/3/18','2/3/18'),
	('11','1','121','1/3/18','2/3/18'),
	('12','2','122','12/12/17','1/12/18'),
	('10','2','123','12/12/17','1/12/17'),
	('20','2','123','2/3/18','3/3/18'),
	('18','2','122','1/5/18','2/5/18'),
	('19','2','121','1/5/18','2/5/18'),
	('19','2','120','1/3/18','2/3/18'),
	('11','2','119','1/7/18','2/7/18'),
	('1','2','118','1/7/18','2/7/18'),
	('2','2','117','1/7/18','2/7/18'),
	('3','2','116','1/7/18','2/7/18'),
	('5','2','116','12/12/17','1/12/18'),
	('4','3','117','1/9/18','2/9/18'),
	('7','3','118','1/3/18','2/3/18'),
	('17','3','119','1/3/18','2/3/18'),
	('16','3','120','1/3/18','2/3/18'),
	('15','3','121','1/3/18','2/3/18'),
	('15','3','122','1/3/18','2/3/18'),
	('14','3','123','1/3/18','2/3/18'),
	('13','3','122','1/3/18','2/3/18'),
	('13','3','121','1/3/18','2/3/18'),
	('19','3','120','12/12/17','1/12/18'),
	('20','4','119','1/3/18','2/3/18'),
	('1','4','121','1/12/18','2/12/18'),
	('3','4','117','1/3/18','2/3/18'),
	('18','4','117','1/3/18','2/3/18'),
	('12','4','122','1/4/18','2/4/18'),
	('11','4','123','1/15/18','2/15/18'),
	('9','4','123','1/15/18','2/15/18'),
	('7','4','117','1/1/18','2/2/18'),
	('4','4','123','1/1/18','2/2/18'),
	('1','4','118','2/2/17','3/2/18'),
	('20','4','118','1/3/18','2/3/18'),
	('1','4','117','1/12/18','2/12/18'),
	('3','4','117','1/13/18','2/13/18'),
	('18','4','117','1/13/18','2/13/18'),
	('12','4','122','1/14/18','2/14/18'),
	('11','4','120','1/15/18','2/15/18'),
	('9','4','120','1/15/18','2/15/18'),
	('7','4','118','1/19/18','2/19/18'),
	('4','4','123','1/19/18','2/19/18'),
	('1','4','119','1/22/18','2/22/18')
;

insert into book_copies(book_copies_book_id, book_copies_branch_id, book_copies_no_of_copies)
values
	('1','1','5'),
	('2','1','5'),
	('3','1','5'),
	('4','1','5'),
	('5','1','5'),
	('6','1','5'),
	('7','1','5'),
	('8','1','5'),
	('9','1','5'),
	('10','1','5'),
	('11','1','5'),
	('12','1','5'),
	('13','1','5'),
	('14','1','5'),
	('15','1','5'),
	('16','1','5'),
	('17','1','5'),
	('18','1','5'),
	('19','1','5'),
	('20','1','5'),
	('1','2','5'),
	('2','2','5'),
	('3','2','5'),
	('4','2','5'),
	('5','2','5'),
	('6','2','5'),
	('7','2','5'),
	('8','2','5'),
	('9','2','5'),
	('10','2','5'),
	('11','2','5'),
	('12','2','5'),
	('13','2','5'),
	('14','2','5'),
	('15','2','5'),
	('16','2','5'),
	('17','2','5'),
	('18','2','5'),
	('19','2','5'),
	('20','2','5'),
	('1','3','5'),
	('2','3','5'),
	('3','3','5'),
	('4','3','5'),
	('5','3','5'),
	('6','3','5'),
	('7','3','5'),
	('8','3','5'),
	('9','3','5'),
	('10','3','5'),
	('11','3','5'),
	('12','3','5'),
	('13','3','5'),
	('14','3','5'),
	('15','3','5'),
	('16','3','5'),
	('17','3','5'),
	('18','3','5'),
	('19','3','5'),
	('20','3','5'),
	('1','4','5'),
	('2','4','5'),
	('3','4','5'),
	('4','4','5'),
	('5','4','5'),
	('6','4','5'),
	('7','4','5'),
	('8','4','5'),
	('9','4','5'),
	('10','4','5'),
	('11','4','5'),
	('12','4','5'),
	('13','4','5'),
	('14','4','5'),
	('15','4','5'),
	('16','4','5'),
	('17','4','5'),
	('18','4','5'),
	('19','4','5'),
	('20','4','5')
;

insert into author(author_book_id,author_name)
values 
	('1','Patrick Rothfuss'),
	('2','Stephen King'),
	('3','Stephen King'),
	('4','Frank Herbert'),
	('5','J.R.R. Tolkien'),
	('6','Christopher Paolini'),
	('6','Patrick Rothfuss'),
	('8','J.K. Rowling'),
	('9','Haruki Murakami'),
	('10','Shel Silverstein'),
	('11','Douglas Adams'),
	('12','Aldous Huxley'),
	('13','William Goldman'),
	('14','Chuck Palahniuk'),
	('15','Louis Sachar'),
	('16','J.K. Rowling'),
	('17','J.K. Rowling'),
	('18','J.R.R. Tolkien'),
	('19','George R.R. Martin'),
	('20','Mark Lee')
;

## Q. How many copies of "The Hobbit" library have in Central branch?

DELIMITER $$
create procedure copies_of_book_in_library_branch(
	in booktitle varchar(200) ,
	in branchname varchar(50), 
	out out_booktitle varchar(200), 
	out out_branchname varchar(200), 
	out out_book_copies int)
begin
	select a.book_title, b.book_copies_no_of_copies, c.library_name 
		into out_booktitle, out_book_copies, out_branchname
		from table_book a 
		inner join book_copies b on b.book_copies_book_id= a.book_id
		inner join library_branch c on c.library_branch_id = b.book_copies_branch_id
		where a.book_title=booktitle and c.library_name=branchname;
end $$
DELIMITER ;

SET @booktitle = '';
SET @branchname = '';
SET @book_copies = 0;

CALL copies_of_book_in_library_branch("The Hobbit", "Central", @booktitle, @branchname, @book_copies);
SELECT @booktitle AS booktitle, @branchname AS branchname, @book_copies AS book_copies;

drop procedure copies_of_book_in_library_branch;

## How many copies of the book title "The Lost Tribe" are available in each branch?

select c.library_name, b.book_copies_no_of_copies 
	from table_book a 
	inner join book_copies b on b.book_copies_book_id= a.book_id
	inner join library_branch c on c.library_branch_id = b.book_copies_branch_id
	where a.book_title="The Lost Tribe"
;

## Q. Retrive the names of the all borrowers who do not have any book check out?  

select distinct(borrower_name) 
	from borrower 
    inner join book_loan on loan_card_number = borrower_card_id 
	where loan_card_number = borrower_card_id
;

/* #- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
 retrieve the book title, the borrower's name, and the borrower's address.  */
 DELIMITER $$
create procedure duedate_list_today(
	in branchname varchar(50), 
	out out_book_title varchar(200), 
	out out_borrower_name varchar(200), 
	out out_borrower_address varchar(200)
)
begin
	select a.book_title, c.borrower_name, c.borrower_address 
	into out_book_title, out_borrower_name, out_borrower_address
	from table_book a 
    inner join book_loan b on book_id=loan_book_id
	inner join borrower c on loan_card_number= borrower_card_id 
	inner join library_branch d on library_branch_id = loan_branch_id
	where loan_due_date = curdate() and library_name=branchname;
end $$
DELIMITER ;

call duedate_list_today("Sharpstown",@out_book_title,@out_borrower_name,@out_borrower_address);

Drop procedure duedate_list_today;

/* #- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
select library_name, count(loan_book_id) as Total 
	from library_branch  
	inner join book_loan 
	on loan_branch_id= library_branch_id 
	group by library_name
;

/* #- Retrieve the names, addresses, and number of books checked out for all borrowers who 
have more than five books checked out. */

select borrower_name, borrower_address, borrower_phone
	from borrower 
	inner join book_loan 
	on borrower_card_id = loan_card_number
	group by borrower_name
	having count(borrower_name)>5
;

/* #- For each book authored by "Stephen King", retrieve the title and the number of copies owned 
by the library branch whose name is "Central".*/

select book_title, book_copies_no_of_copies, library_name
	from author 
	inner join table_book on book_id= author_book_id
	inner join book_copies on author_book_id = book_copies_book_id
	inner join library_branch on library_branch_id= book_copies_branch_id
	where author_name="Stephen King" and library_name="Central"
;

