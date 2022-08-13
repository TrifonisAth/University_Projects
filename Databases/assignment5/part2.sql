"1η Ερώτηση"
/* "Βρες ποιοί ηθοποιοί έχουν πάρει μέρος σε περισσότερες από 100 ταινίες,
εμφάνισε το όνομα των ηθοποιών και τον αριθμό των ταινιών που πήραν μέρος."
Output: 1 rows
*/
select p.name, count(mc.movie_id) as movie_count
from Movie_cast mc
inner join Person p on mc.person_id = p.person_id
group by p.person_id
having count(mc.movie_id) > 100;

"2η Ερώτηση"
/* "Εμφάνισε τους τίτλους των ταινίων με το μεγαλύτερο πλήθος γυναικών ηθοποιών, σε φθίνουσα σειρά.
Οι ταινίες αυτές πρέπει να έχουν περισσότερες από 20 γυναίκες ηθοποιούς."
Output: 118 rows
*/
select m.title, count(p.person_id) as cnt
from Movie m
inner join Movie_cast mc on m.id = mc.movie_id
inner join Person p on p.person_id = mc.person_id
where gender = 1
group by m.id
having count(p.person_id) > 20
order by cnt desc;

"3η Ερώτηση"
/* "Εμφάνισε τα επαγγέλματα στα οποία υπάρχουν γυναίκες με first name Maria και τον αριθμό των γυναικών με αυτό το όνομα,
στα επαγγέλματα αυτά."
Output: 12 rows
*/
select mcr.job, count(distinct p.person_id) as cnt
from Person p
inner join Movie_crew mcr on p.person_id = mcr.person_id
where p.gender = 1 and p.name like 'Maria %'
group by mcr.job;
