use books;

# Create an SQL view for each of these themes. Each view should contain the ISBN and title of a book
# adventure (48 books), love (39), science (39), romance (38), fantasy (35), horror (31), mystery (30), sex (29), society (26), magic (25)

# Books have theme 'adventure'
create view adventure_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'adventure';
drop view adventure_book;

select * from adventure_book;

# Books have theme 'love'
create view love_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'love';
drop view love_book;

select * from love_book;

# Books have theme 'science'
create view science_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'science';
drop view science_book;

select * from science_book;

# Books have theme 'romance'
create view romance_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'romance';
drop view romance_book;

select * from romance_book;

# Books have theme 'fantasy'
create view fantasy_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'fantasy';
drop view fantasy_book;

select * from fantasy_book;

# Books have theme 'horror'
create view horror_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'horror';
drop view horror_book;

select * from horror_book;

# Books have theme 'mystery'
create view mystery_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'mystery';
drop view mystery_book;

select * from mystery_book;

# Books have theme 'sex'
create view sex_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'sex';
drop view sex_book;

select * from sex_book;

# Books have theme 'society'
create view society_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'society';
drop view society_book;

select * from society_book;

# Books have theme 'magic'
create view magic_book as 
select ti.isbn, title from titles ti join themes th on ti.isbn = th.isbn where theme = 'magic';
drop view magic_book;

select * from magic_book;

# Create an SQL view for each of these qualities. Each view should contain the ISBN and title of a book (task 2).
# thrilling (80), dramatic (70), dark (69), suspenseful (66), profound (59), witty (56), historical (56), philosophical(56), entertaining(55), political (50)

# Books have quality 'thrilling'
create view thrilling_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'thrilling';
drop view thrilling_book;

select * from thrilling_book;

# Books have quality 'dramatic'
create view dramatic_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'dramatic';
drop view dramatic_book;

select * from dramatic_book;

# Books have quality 'dark'
create view dark_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'dark';
drop view dark_book;

select * from dark_book;

# Books have quality 'suspenseful'
create view suspenseful_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'suspenseful';
drop view suspenseful_book;

select * from suspenseful_book;

# Books have quality 'profound'
create view profound_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'profound';
drop view profound_book;

select * from profound_book;

# Books have quality 'witty'
create view witty_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'witty';
drop view witty_book;

select * from witty_book;

# Books have quality 'historical'
create view historical_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'historical';
drop view historical_book;

select * from historical_book;

# Books have quality 'philosophical'
create view philosophical_book as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'philosophical';
drop view philosophical_book;

select * from philosophical_book;

# Books have quality 'entertaining'
create view entertaining_look as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'entertaining';
drop view entertaining_look;

select * from entertaining_look;

# Books have quality 'political'
create view political_look as 
select t.isbn, title from titles t join qualities q on t.isbn = q.isbn where quality = 'political';
drop view political_look;

select * from political_look;