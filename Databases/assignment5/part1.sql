"--Ερώτημα 4--"

"Με τις παρακάτω queries δημιουργούμε τους πίνακες που απαιτούνται. Θεωρήσαμε πως το person_id
ανήκει στον πίνακα Person και στους αλλους δύο πίνακες εμφανίζεται ως ξένο κλειδί."
create table Person(
   gender int,
   person_id int,
   name varchar(40),
   primary key(person_id)
   );

create table CrewMember(
   gender int,
   person_id int,
   name varchar(40),
   foreign key (person_id) references Person(person_id),
   primary key (person_id)
   );

create table Actor(
   gender int,
   person_id int,
   name varchar(40),
   foreign key (person_id) references Person(person_id),
   primary key (person_id)
   );

"--Ερώτημα 5--"

"Με την παρακάτω query εντοπίζονται οι συνδυασμοί των εγγραφών Movie_cast με Movie_crew, στους οποίους
παρατηρήσαμε πως υπάρχει διαφορετικό gender στο ίδιο άτομο με όνομα Peter Malota, ο οποίος είναι αρσενικού
γένους ηθοποιός. Έπειτα πήγαμε στις εγγραφές του Movie_crew οι οποίες τον είχαν με gender = 0 και το ενημερώσαμε
σε gender = 2."
SELECT  *
FROM Movie_Cast mc INNER JOIN Movie_Crew mcr
ON mc.person_id = mcr.person_id
WHERE mc.gender <> mcr.gender OR mc.name <> mcr.name;

"Eδώ ενημερώσαμε τις κατάλληλες εγγραφές της Movie_crew που είχαν λάθος στοιχεία."
UPDATE movie_crew
SET gender=2
WHERE person_id=1785844 and gender<>2;

"--Ερώτημα 6--"

"Στον πίνακα Person βάλαμε τις εγγραφές από την ένωση των πινάκων Movie_cast και Movie_crew. Η πράξη της ένωσης UNION είναι
πράξη συνόλων με αποτέλεσμα οι εγγραφές που προκύπτουν να μην έχουν διπλότυπα."
insert into Person
select mc.gender, mc.person_id, mc.name
from Movie_cast mc
UNION
select mcr.gender, mcr.person_id, mcr.name
from Movie_crew mcr;

"Στον πίνακα Actor εισάγαμε κάθε ξεχωριστή εγγραφή της προβολής gender, person_id, name του πίνακα Movie_cast."
insert into Actor
select distinct mc.gender, mc.person_id, mc.name
from Movie_cast mc;

"Στον πίνακα CrewMember εισάγαμε κάθε ξεχωριστή εγγραφή της προβολής gender, person_id, name του πίνακα Movie_crew."
insert into CrewMember
select distinct mc.gender, mc.person_id, mc.name
from Movie_crew mc;

"--Ερώτημα 7--"

"Στους πίνακες Movie_cast και Movie_crew αφαιρέσαμε τα πεδία που περίσευαν έπειτα από την BCNF κανονικοποίηση
που πραγματοποιήσαμε σε προηγούμενο βήμα της εργασίας, στο οποίο αποσυνθέσαμε τους αρχικούς πίνακες.
Το αποτέλεσμα ήταν να έρθουν οι πίνακες σε BCNF επειδή δεν έχουν πλέον συναρτησιακές εξαρτήσεις."
ALTER TABLE Movie_cast
drop COLUMN name, 
drop column gender;

ALTER TABLE Movie_crew
drop COLUMN name, 
drop column gender;