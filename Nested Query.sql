# Author: Haolin Zhang
# Date: 24-02-2019
use books;

# Write an SQL query for returning the title of all books with more than one author.
select t.title from titles t join authors a on t.ISBN = a.ISBN where a.rank = 2;
# Write an SQL query for returning the title of all books with just one author. 
select t.title from titles t join authors a on t.ISBN = a.ISBN group by t.title having count(title) = 1;
# Write an SQL query for returning the title of all books on the theme of magic and heroism but not evil.
select title from titles where ISBN in 
	(select distinct t.ISBN from
		(select distinct e.ISBN from 
			(select ISBN, theme from themes where ISBN not in 
				(select distinct ISBN from themes where theme = '%evil%')) e
	where e.theme = '%magic%') m left join themes t on m.ISBN = t.ISBN where t.theme = '%heroism%');
# Write an SQL query for returning the names of all authors of at least two books on science.
select Author from authors a join themes t on a.ISBN = t.ISBN where theme = 'science' group by a.Author having count(a.Author) > 1;
# Write an SQL query for returning the titles of all intelligent or sophisticated books on marriage.
select distinct Title from (select Title, Theme from titles b join qualities q on b.ISBN = q.ISBN join themes t on q.ISBN = t.ISBN 
where q.Quality = 'sophisticated' or q.Quality = 'intelligent') i where i.Theme = "marriage";