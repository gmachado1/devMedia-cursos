import pymongo

client = pymongo.MongoClient("localhost", 27017)
db = client.test

db.my_collection.insert_one({"x": 10})

db.my_collection.insert_one({"x": 8})

db.my_collection.insert_one({"x": 11})

db.my_collection.find_one()

for item in db.my_collection.find():
     print(item["x"])
     
db.my_collection.remove({"x":10})

for item in db.my_collection.find():
     print(item["x"])
