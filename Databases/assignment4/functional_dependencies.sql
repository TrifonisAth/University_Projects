"3o - Γίνεται join ανάμεσα σε δύο πίνακες mc1, mc2,  του Movie_cast πάνω στο πεδίο person_id και ζητάμε να προβληθούν όλες οι
πλειάδες στις οποίες το name ή το gender διαφέρει ανάμεσα στα mc1 και mc2."
SELECT *
FROM Movie_Cast mc1,Movie_Cast mc2
where mc1.person_id=mc2.person_id and (mc1.name<>mc2.name or mc1.gender<>mc2.gender);

"4o - Σε αυτό το ερώτημα ακολουθείται η ίδια τακτική με αυτή που χρησιμοποιήθηκε στο προηγούμενο ερώτημα, αλλά εφαρμόστηκε
στο table Movie_crew αυτή την φορά."
SELECT *
FROM Movie_Crew mc1,Movie_Crew mc2
where mc1.person_id=mc2.person_id and (mc1.name<>mc2.name or mc1.gender<>mc2.gender);