# 1a
df = spark.read.format("csv").option("header", "true").load("/FileStore/tables/test.csv")
# 1b
print(df.count())
# 1c
df.createOrReplaceTempView("tmp")
spark.sql("SELECT COUNT(DISTINCT city) FROM tmp").show()
# 1d
print(df.groupBy("city").count().orderBy("count", ascending=False).first()["city"])
