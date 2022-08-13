"Προσθέτουμε ως πρωτεύοντα κλειδιά τα κλειδιά των οντοτήτων που συσχετίζονται μέσω της Movie_genres(Movie, Genre)."
alter table movie_genres
add primary key(movie_id, genre_id);