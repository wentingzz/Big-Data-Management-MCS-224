//Insert those to mongodb
//[{
//"created_at": "Wed Oct 10 20:19:24 +0000 2022",
//"id": 1050118621198921728,
//"text": "hey this is a nice day",
//"user": {"username": "bob123" }
//},
//{
//"created_at": "Wed Oct 10 20:43:24 +0000 2022",
//"id": 1050118621198921729,
//"text": "it is rainy today",
//"location": "Irvine",
//"user": {"username": "alice123" }
//},
//{
//"created_at": "Wed Oct 10 20:49:24 +0000 2022",
//"id": 1050118621198921730,
//"text": "Where is everyone?",
//"location": "Los Angeles",
//"user": {"username": "bob123" }
//},
//{
//"created_at": "Wed Oct 11 21:49:24 +0000 2022",
//"id": 1050118621198921731,
//"text": "So many things to do!",
//"location": "Irvine",
//"user": {"username": "bob123" }
//}]


//1c
db.tweets.find({"user.username":"bob123", location:"Irvine"}, {id : 1, _id : 0})
//1d
db.tweets.count({location:"Irvine"})

//2b
db.ts.find({"data.entities.hashtags": {
	$elemMatch: {
	tag: "weather"
	}
}}, {"data.text": 1})

//2c
db.ts.aggregate([
	{"$group": {
		_id: "$data.author_id",
		count: {$sum: 1}
	}},
	{$sort:{
		count: -1
	}},
	{$limit: 10}
]);

