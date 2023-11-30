from pyspark.sql.functions import input_file_name, expr
# 1a
df = spark.read.format("csv").option("header", "true").load("/FileStore/tables/test.csv")
# 1b
print(df.count())
# 1c
df.createOrReplaceTempView("tmp")
spark.sql("SELECT COUNT(DISTINCT city) FROM tmp").show()
# 1d
print(df.groupBy("city").count().orderBy("count", ascending=False).first()["city"])


# 2a
df = spark.read.format("csv").option("header", "true").load("dbfs:/FileStore/shared_uploads/wentiz10@uci.edu/TMDB_movie_dataset_v11.csv")
fm = df.filter(df.spoken_languages == 'French')
fm.createOrReplaceTempView("tmp1")
spark.sql("SELECT SUM(vote_average * vote_count)/SUM(vote_count) FROM tmp1").show()
# 2b
df.withColumn('word', F.explode(F.split(F.regexp_replace(F.lower(F.col('overview')), '[^a-zA-Z0-9\\s]', ''), ' '))).groupBy('word').count()
# 2c
df_words = df.select("title", "vote_average").withColumn("word", F.explode(F.split(F.col("title"), " "))).groupBy("word").agg(F.avg("vote_average").alias("score"), F.count("title").alias("title_count"))
df_10_titles = df_words.filter("title_count >= 10")
top_words = df_10_titles.orderBy(F.col("score").desc()).show(10)
# 2d
df = spark.read.format("csv").option("header", "true").option("quote", "\"").option("escape", "\"").load("dbfs:/FileStore/new/*.csv").withColumn("movie_name", expr("regexp_replace(substring(split(substring_index(input_file_name(), '/', -1), '.csv')[0], 1, len(substring_index(input_file_name(), '/', -1)) - 9), '_', ' ') ")).withColumn("year", expr("substring(split(substring_index(input_file_name(), '/', -1), '.csv')[0], -4)"))
# 2e
df.filter(df.movie_name == 'The Caine Mutiny').select("title", "review").show(10)
# 2f
# Write pyspark to count the number of movies that appear in both datasets. Match using title (exact match, case insensitive) and year.
#df0 contains the first dataset, df contains the second
df0 = df0.withColumn("year", F.substring(F.col("release_date"), 1, 4))
df0_movies = df0.select("title", "year").distinct()
df_movies = df.select("movie_name", "year").distinct()
df_movies.show(10)
common_movies = df0_movies.join(df_movies, (F.lower(df0_movies["title"]) == F.lower(df_movies["movie_name"])) & (df0_movies["year"] == df_movies["year"]), "inner" )
print(common_movies.count())
# 2g
grouped = df.groupBy("movie_name").agg(F.mean("rating").alias("avg_rating"), F.count("rating").alias("review_count"))
grouped.filter("review_count >= 100").orderBy("avg_rating", ascending=False).show(20)
# 2h
grouped = df.groupBy("username").agg(F.count("rating").alias("review_count"))
grouped.orderBy("review_count", ascending=False).show(20)
