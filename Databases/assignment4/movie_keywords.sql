"Προσθέτουμε ως πρωτεύοντα κλειδιά τα κλειδιά των οντοτήτων που συσχετίζονται μέσω της Movie_keywords(Movie, Keyword)."
alter table movie_keywords
add primary key(movie_id, keyword_id);