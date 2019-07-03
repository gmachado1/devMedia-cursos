import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;

/**
 * Java + MongoDB Hello world Example
 * 
 */
public class HelloWorld {
	public static void main(String[] args) {
 
 	
			// connect to mongoDB, ip and port number
			MongoClient mongoClient = new MongoClient();
 
			// get database from MongoDB,
			// if database doesn't exists, mongoDB will create it automatically
			 DB db = mongoClient.getDB("JavaDB");
			
 
			// Get collection from MongoDB, database named "yourDB"
			// if collection doesn't exists, mongoDB will create it automatically
			DBCollection collection = db.getCollection("ColJava");
			
			// create a document to store key and value
			BasicDBObject document = new BasicDBObject();
			document.put("id", 1001);
			document.put("msg", "hello world mongoDB in Java");
 
			// save it into collection named "yourCollection"
			collection.insert(document);
			
			document = new BasicDBObject();
			document.put("id", 1002);
			document.put("msg", "Second message");
			
			collection.insert(document);
 
			// query it
			DBCursor cursor = collection.find();
 
			// loop over the cursor and display the retrieved result
			while (cursor.hasNext()) {
				System.out.println("Document:" + cursor.next());
			}	
			
			 
			BasicDBObject documentRemove = new BasicDBObject();
      documentRemove.put("id", 1001);
      collection.remove(documentRemove);
      
      cursor = collection.find();
 
			// loop over the cursor and display the retrieved result
			while (cursor.hasNext()) {
				System.out.println("Document:" + cursor.next());
			}
 
			System.out.println("Done");
 		
			mongoClient.close();
	
 	
	}
	
}