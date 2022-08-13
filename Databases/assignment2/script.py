import csv, ast
fileToRead = open("keywords.csv", encoding='utf8')
fileToWrite1 = open("movie_keywords.csv",'w', encoding='utf8', newline='')
fileToWrite2 = open("keyword.csv",'w', encoding='utf8', newline='')
csvreader = csv.reader(fileToRead)
writer1 = csv.writer(fileToWrite1, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
writer2 = csv.writer(fileToWrite2, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
writer1.writerow(['movie_id','keyword_id'])     # movie_keywords.csv header.
writer2.writerow(['id','name'])                 # keyword.csv header.
next(csvreader, None)       # Skips the header.
for row in csvreader:
    movie_id = row[0]
    jsonString = row[1]
    data = ast.literal_eval(jsonString)
    for keyword in data:
        writer1.writerow([movie_id,keyword['id']])
        writer2.writerow([keyword['id'],keyword['name']])
fileToRead.close()
fileToWrite1.close()
fileToWrite2.close()