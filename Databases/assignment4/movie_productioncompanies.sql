"Προσθέτουμε ως πρωτεύοντα κλειδιά τα κλειδιά που έχουν η κάθε μία από τις δύο οντότητες που συσχετίζει η συσχέτιση(Movie, Productioncompany)."
alter table movie_productioncompanies
add primary key(movie_id, pc_id);