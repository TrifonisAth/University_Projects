import psycopg2
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import axes3d


# Update connection string information.
host = "dbteam2022.postgres.database.azure.com"
dbname = "MovieLens"
user = "examiner@dbteam2022"
password = "db2022"
sslmode = "require"

# Construct connection string.
conn_string = "host={0} user={1} dbname={2} password={3} sslmode={4}".format(host, user, dbname, password, sslmode)
conn = psycopg2.connect(conn_string)
print("Connection established")

#Open a cursor to perform database operations.
cursor = conn.cursor()

# Query 1 - Movies per year.
print("Query 1 - Movies per Year.")
q1 = "select extract(year from release_date) as year, count(m.id)\
        from movie m\
        where release_date is not null\
        group by year;"
cursor.execute(q1)
rows = cursor.fetchall()
plt.xlabel('Year')
plt.ylabel('Movies')
for row in rows:
    plt.bar(row[0], row[1])
plt.show()

# Query 2 - Movies per Genre.
print("Query 2 - Movie per Genre.")
q2 = "select g.name, count(mg.movie_id)\
    from genre g\
    left outer join movie_genres mg on g.id = mg.genre_id\
    group by g.name;"
cursor.execute(q2)
rows = cursor.fetchall()
plt.xlabel('Genres')
plt.ylabel('Movies')
plt.xticks(rotation=90)
for row in rows:
    plt.bar(row[0], row[1])
plt.show()

# Query 3 - Movies per Genre and year.
print("Query 3 - Movies by Genre and Year.")
q3 = "select g.name, extract(year from release_date) as year, count(mg.movie_id)\
    from genre g\
    left outer join movie_genres mg on g.id = mg.genre_id\
    inner join movie m on m.id = mg.movie_id\
    where m.release_date is not null\
    group by g.name, year\
    order by g.name;"
cursor.execute(q3)
rows = cursor.fetchall()
xVal = []
yVal = []
zVal = []
for row in rows:
    xVal.append(row[0])
    yVal.append(row[1])
    zVal.append(row[2])
# Initializing Figure
fig = plt.figure()
ax1 = fig.add_subplot(111, projection='3d')
ax1.set_facecolor((1.0, 1.0, 1.0))
# Creating a dictionary from categories to x-axis coordinates
xCategories = xVal
i=0
xDict = {}
x=[]
for category in xCategories:
  if category not in xDict:
    xDict[category]=i
    x.append(i)
    i+=1
  else:
    x.append(xDict[category])
# Defining the starting position of each bar (x is already defined)
z = np.zeros(len(x))
# Defining the length/width/height of each bar.
dx = np.ones(len(x))*0.1
dy = np.ones(len(x))
dz = zVal
ax1.bar3d(x, yVal, z, dx, dy, dz)
ax1.set_zlim([0, max(zVal)])
plt.xticks(range(len(xDict.values())), xDict.keys())
plt.show()

# Query 4 - Highest budget by year.
print("Highest Movie Budget by Year.")
q4 = "select extract(year from release_date) as year, max(m.budget)\
    from movie m\
    where m.budget is not null and release_date is not null\
    group by year;"
cursor.execute(q4)
rows = cursor.fetchall()
plt.xlabel('Year')
plt.ylabel('Budget (in millions)')
for row in rows:
    budget = int(row[1]) / 1000000
    plt.bar(row[0], budget)
plt.show()

# Actor Stats.

# Query 5 - Sean Connery movies total revenue by year.
print("Sean Connery Total Revenue of Movies that he Participated, by Year.")
q5 = "select extract(year from m.release_date) as year, sum(m.revenue) as revenue\
    from actor a\
    join movie_cast mc on mc.person_id = a.person_id\
    join movie m on m.id = mc.movie_id\
    where a.person_id = 738\
    group by year;" 
cursor.execute(q5)
rows = cursor.fetchall()
plt.xlabel('Year')
plt.ylabel('Total Revenue (in millions) - Movies Participated by Sean Connery')
for row in rows:
    rev = int(row[1]) / 1000000
    plt.bar(row[0], rev)
plt.show()

# User ratings.

# Query 6 - Average rating by user.
print("Query 6 - Average rating by user.")
q6 = "select user_id, avg(rating) as avgRating\
    from ratings\
    group by user_id\
    order by avgRating;"
cursor.execute(q6)
rows = cursor.fetchall()
xList = []
yList = []
for row in rows:
    average = format(row[1], ".1f")
    xList.append(row[0])
    yList.append(average)
x = np.array(xList)
y = np.array(yList)
plt.xlabel('User Id')
plt.ylabel('Average Rating')
plt.scatter(x, y,s=1)
plt.show()

# Query 7 - Ratings by user.
print("Query 7 - Ratings by user.")
q7 = "select user_id, count(user_id)\
    from ratings\
    group by user_id;"
cursor.execute(q7)
rows = cursor.fetchall()
xList = []
yList = []
for row in rows:
    xList.append(row[0])
    yList.append(row[1])
x = np.array(xList)
y = np.array(yList)
plt.xlabel('User Id')
plt.ylabel('Number of Ratings')
plt.scatter(x, y,s=1)
plt.show()

# Query 8 - Query 8 - Amount of ratings and Average rating by User.
print("Query 8 - Amount of ratings and Average rating by User.")
q8 = "select user_id, count(user_id),avg(rating) as avgRating\
    from ratings\
    group by user_id;"
cursor.execute(q8)
rows = cursor.fetchall()
xList = []
yList = []
for row in rows:
    xList.append(row[1])
    yList.append(row[2])
x = np.array(xList)
y = np.array(yList)
plt.xlabel('Number of Ratings')
plt.ylabel('AVG rating')
plt.scatter(x, y,s=1)
plt.show()

# Query 9 - Average movie rating by genre.
print("Query 9 - Average movie rating by genre.")
q9 = "select g.name, avg(r.rating) as avgRating\
    from ratings r\
    join movie_genres mg on mg.movie_id = r.movie_id\
    join genre g on g.id = mg.genre_id\
    group by g.id\
    order by avgRating;"
cursor.execute(q9)
rows = cursor.fetchall()
plt.xlabel('Genre')
plt.ylabel('Average rating')
for row in rows:
    if (row[1] is None):
        average = 0
    else:
        average = format(row[1], ".2f") 
    plt.bar(row[0], average)
plt.show()

# Disconnecting.
cursor.close()
conn.close()
print("Disconnected...")