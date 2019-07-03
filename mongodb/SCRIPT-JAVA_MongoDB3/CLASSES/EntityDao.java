package com.javadao.dao;


import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class EntityDao<T> implements IDao 
{


    private Class<T> persistentClass;
    
    private DBCollection dbCollection;

    public EntityDao(Class<T> persistentClass) {
        this.persistentClass = persistentClass;
        this.dbCollection =
                MongoConnection.getInstance()
                    .getDB().getCollection(persistentClass.getSimpleName());
    }

    protected DBCollection getDbCollection() {
        return dbCollection;
    }

    public void save(Map<String, Object> mapEntity) {
        BasicDBObject document = new BasicDBObject(mapEntity);

        dbCollection.save(document);

        System.out.println("Save :> " + document);
    }

    public void update(Map<String, Object> mapQuery,
                       Map<String, Object> mapEntity) {
        BasicDBObject query = new BasicDBObject(mapQuery);

        BasicDBObject entity = new BasicDBObject(mapEntity);

        dbCollection.update(query, entity);
    }

    public void delete(Map<String, Object> mapEntity) {
        BasicDBObject entity = new BasicDBObject(mapEntity);

        dbCollection.remove(entity);
    }

    public DBObject findOne(Map<String, Object> mapEntity) {
        BasicDBObject query = new BasicDBObject(mapEntity);

        return dbCollection.findOne(query);
    }

    public List<DBObject> findAll() {
        List<DBObject> list = new ArrayList<DBObject>();

        DBCursor cursor = dbCollection.find();

        while (cursor.hasNext()) {
            list.add(cursor.next());
        }

        return list;
    }

    public List<DBObject> findKeyValue(Map<String, Object> keyValue) {
        List<DBObject> list = new ArrayList<DBObject>();

        DBCursor cursor = dbCollection.find(new BasicDBObject(keyValue));

        while (cursor.hasNext()) {
            list.add(cursor.next());
        }

        return list;
    }
	
}
