"Προσθέτουμε ως πρωτεύοντα κλειδιά τα κλειδιά των οντοτήτων που συσχετίζονται μέσω της Movie_collection(Movie, Collection)."
alter table movie_collection
add primary key(movie_id);