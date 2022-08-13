--1. Αριθμός ταινιών ανά έτος.
select extract(year from release_date) as year, count(m.id)
from movie m
where release_date is not null
group by year;

--2. Αριθμός ταινιών ανά είδος.
select g.name, count(mg.movie_id)
from genre g
left outer join movie_genres mg on g.id = mg.genre_id
group by g.name;

--3. Ταινίες ανά κατηγορία και ανά έτος.
select g.name, extract(year from release_date) as year, count(mg.movie_id)
from genre g
left outer join movie_genres mg on g.id = mg.genre_id
inner join movie m on m.id = mg.movie_id
where m.release_date is not null
group by g.name, year
order by g.name;

--4. Υψηλότερο budget ταινίας ανά έτος.
select extract(year from release_date) as year, max(m.budget)
from movie m
where m.budget is not null and release_date is not null
group by year;

--5. Σύνολο εσόδων ανά έτος για τις ταινίες που έχει πάρει μέρος ο Sean Connery.
select extract(year from m.release_date) as year, sum(m.revenue) as revenue
from actor a
join movie_cast mc on mc.person_id = a.person_id
join movie m on m.id = mc.movie_id
where a.person_id = 738
group by year;

--6 Μέσος όρος βαθμολογίας ανά χρήστη.
select user_id, avg(rating) as avgRating
from ratings
group by user_id
order by avgRating;

--7 Αριθμός βαθμολογιών ανά χρήστη.
select user_id, count(user_id)
from ratings
group by user_id;

--8 Αριθμός αξιολογήσεων και μέσος όρος βαθμολογίας ανά χρήστη.
select user_id, count(user_id),avg(rating) as avgRating
from ratings
group by user_id;


--9 Μέση βαθμολογία ανά κατηγορία ταινιών.
select g.name, avg(r.rating) as avgRating
from ratings r
join movie_genres mg on mg.movie_id = r.movie_id
join genre g on g.id = mg.genre_id
group by g.id
order by avgRating;