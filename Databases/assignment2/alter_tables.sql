ALTER TABLE collection
ADD PRIMARY KEY (ID);

ALTER TABLE genre
ADD PRIMARY KEY (ID);

ALTER TABLE keyword
ADD PRIMARY KEY (ID);

ALTER TABLE movie
ADD PRIMARY KEY (ID);

ALTER TABLE productioncompany
ADD PRIMARY KEY (ID);

ALTER TABLE ratings
ADD PRIMARY KEY (movie_id,user_id);

ALTER TABLE movie_cast
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_collection
ADD PRIMARY KEY (movie_id);

ALTER TABLE movie_collection
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_collection
ADD FOREIGN KEY (collection_id) REFERENCES collection(ID);

ALTER TABLE movie_crew
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_genres
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_genres
ADD FOREIGN KEY (genre_id) REFERENCES Genre(ID);

ALTER TABLE movie_keywords
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_keywords
ADD FOREIGN KEY (keyword_id) REFERENCES keyword(ID);

ALTER TABLE movie_productioncompanies
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);

ALTER TABLE movie_productioncompanies
ADD FOREIGN KEY (pc_id) REFERENCES Productioncompany(ID);

ALTER TABLE ratings
ADD FOREIGN KEY (movie_id) REFERENCES Movie(ID);