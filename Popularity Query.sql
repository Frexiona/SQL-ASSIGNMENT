# Author: Haolin Zhang
# Date: 02-03-2019
use books;

# Which author (or authors ranked jointly) have authored the most books?
select author from authors group by author having count(author) = 
(select count(*) num from authors group by author order by count(*) desc limit 1);

# Which theme is the most popular in the dataset?
select theme from themes group by theme having count(theme) = 
(select count(*) from themes group by theme order by count(*) desc limit 1);

# Which quality is the most common in the dataset?
select quality from qualities group by quality having count(quality) = 
(select count(*) from qualities group by quality order by count(*) desc limit 1);

# What is the most common quality of books in the theme of science?
select quality from qualities q join themes t on q.isbn = t.isbn where theme like "%science%" group by quality having count(quality) = 
(select count(*) from qualities q join themes t on q.isbn = t.isbn where theme like "%science%" group by quality order by count(*) desc limit 1);

# Which author (or authors ranked jointly) have authored the most books on magic or fantasy?
select author from 
(select distinct a.isbn, author from authors a join themes t on a.isbn = t.isbn where t.theme like "%magic%" or t.theme like "%fantasy%") i
group by author having count(author) = 
(select count(*) from 
(select distinct a.isbn, author from authors a join themes t on a.isbn = t.isbn where t.theme like "%magic%" or t.theme like "%fantasy%") i
group by author order by count(*) desc limit 1);
