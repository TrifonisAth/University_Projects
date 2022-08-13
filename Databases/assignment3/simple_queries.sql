/*"Βρες το όνομα και τον μέσο όρο κριτικών κάθε ταινίας (για όσες δεν έχουν βάλε null) στην κατηγορία δράση."
Output: 1816
*/
select m.title, avg(r.rating), m.release_date
from movie m
left outer join ratings r
on r.movie_id = m.id
inner join movie_genres mg
on m.id = mg.movie_id and mg.genre_id = 28
group by m.id, m.title


/* "Βρες τους τίτλους ταινιών που εχει δημιουργήσει η DreamWorks και έχουν ΜΟ βαθμολογιας μεγαλύτερο του 3."
Output: 18 rows
*/
select pc.name as company, m.title, avg(r.rating) as Rating
from movie_productioncompanies mpc 
inner join productioncompany pc 
on pc.id=mpc.pc_id
inner join movie m
on m.id=mpc.movie_id
inner join ratings r
on m.id = r.movie_id
where pc.name like '%DreamWorks%' 
group by pc.name, m.title
having avg(r.rating)>3


/* "Βρες όλους τους ηθοποιούς που έχουν παίξει τον ρόλο του James Bond, τον τίτλο της ταινίας, την ημερομηνία κυκλοφορίας τους καθώς και τον ηθοποιό που τον υποδυόταν,
για ημερομηνίες ανάμεσα σε 1970 και 2000."
Output: 14 rows
*/
select mc.name, m.title, m.release_date
from movie m
inner join movie_cast mc
on m.id = mc.movie_id
where mc.character = 'James Bond' and m.release_date between '1970-01-01' and '2000-01-01'


/* "Βρες το άθροισμα των budget των ταινιών που συμμετέχει ο κάθε ηθοποιός
και ταξινόμησε τους σε φθίνουσα σειρά βάσει του παραπάνω αθροίσματος."
Output: 69830 rows
*/
select mc.name, sum(m.budget) as sum_movie_budget
from movie_cast mc
inner join movie m
on m.id = mc.movie_id
group by mc.person_id, mc.name
order by sum_movie_budget desc


/* "Βρες τους τίτλους των ταινιών στις οποίες υπήρχε ο Quentin Tarantino στους συντελεστές."
Output: 16 rows
*/
select distinct m.title as Tarantino_movies
from movie m
inner join movie_crew mc
on m.id in (select mc1.movie_id
	from movie_crew mc1, movie_crew mc2
	where mc1.name like 'Quentin Tarantino' and mc1.movie_id <> mc2.movie_id)


/* "Βρες τις 20 πιο συνηθισμένες λέξεις κλειδιά σε όλες τις ταινίες."
Output: 20 rows
*/
select k.name as keyword, count(mk.keyword_id)
from keyword k
inner join movie_keywords mk
on k.id = mk.keyword_id
group by mk.keyword_id, k.name
order by count desc
limit 20


/* "Βρες τους μέσους όρους των κριτικών όλων των ταινιών."
Output: 9994 rows
*/
select m.title, avg(r.rating) as rating
from movie m
left outer join ratings r
on m.id = r.movie_id
group by m.id


/* "Βρες τις ταινίες στις οποίες ο Nikolas Cage συμμετείχε ως ηθοποιός και
ως μέρος της παραγωγής ταυτόχρονα."
Output: 1 row
*/
select mcrew.name, m.title, mcast.character, mcrew.job as second_job
from movie m
inner join movie_cast mcast
on m.id = mcast.movie_id
inner join movie_crew mcrew
on mcrew.name = mcast.name
where mcast.name = 'Nicolas Cage' and mcast.movie_id = mcrew.movie_id


/* "Βρες τις 10 εταιρείες παραγωγών με τις περισσότερες ταιν΄΄ιες."
Output: 10 rows
*/
select pc.name, count(mpc.pc_id)
from productioncompany pc
inner join movie_productioncompanies mpc
on mpc.pc_id = pc.id
group by mpc.pc_id, pc.name
order by count(mpc.pc_id) desc
limit 10


/* "Βρες το συνολικό budget για κάθε collection ταινιών."
Output: 735 rows
*/
select c.name, sum(m.budget) as budget
from collection c
inner join movie_collection mc
on c.id = mc.collection_id
inner join movie m
on m.id = mc.movie_id
group by mc.collection_id, c.name
order by sum(m.budget) desc


/* "Βρες το συνολικό revenue της κάθε κατηγορίας (εφόσον το genre αντιστοιχεί σε
ταινίες οι οποίες έχουν στοιχεία για το revenue)."
Output: 9 rows
*/
select g.name, sum(m.revenue) as revenue
from genre g
inner join movie_genres mg
on g.id = mg.genre_id
inner join movie m
on mg.movie_id = m.id
group by g.id, g.name


/* "Βρες όλες τις ταινίες που έχει παίξει ο leonardo di caprio."
Output: 16 rows
*/
select  m.title
from movie_cast cst
inner join movie m
on m.id=cst.movie_id
where cst.name='Leonardo DiCaprio'