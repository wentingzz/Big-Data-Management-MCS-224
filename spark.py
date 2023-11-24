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


