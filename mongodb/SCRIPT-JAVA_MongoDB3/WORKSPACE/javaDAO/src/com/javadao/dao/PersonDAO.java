package com.javadao.dao;

import com.javadao.converter.PersonConverter;

import com.javadao.entity.Person;
import com.mongodb.DBObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PersonDAO  extends EntityDao<Person> {

    public PersonDAO() {
        super(Person.class);
    }

    public void save(Person person) {
        Map<String, Object> mapPerson =
                new PersonConverter().converterToMap(person);

        save(mapPerson);
    }

    public void update(Person oldPerson, Person newPerson) {
        Map<String, Object> query =
                new PersonConverter().converterToMap(oldPerson);

        Map<String, Object> map =
                new PersonConverter().converterToMap(newPerson);

        update(query, map);
    }

    public void delete(Person person) {
        Map<String, Object> map =
                new PersonConverter().converterToMap(person);

        delete(map);
    }

    public Person findPerson(Map<String, Object> mapKeyValue) {
        DBObject dbObject = findOne(mapKeyValue);

        Person person =
                new PersonConverter().converterToPerson(dbObject);

        return person;
    }

    public List<Person> findPersons() {
        List<DBObject> dbObject = findAll();

        List<Person> persons = new ArrayList<Person>();

        for (DBObject dbo : dbObject) {
            Person person = new PersonConverter().converterToPerson(dbo);

            persons.add(person);
        }

        return persons;
    }

    public List<Person> findPersons(Map<String, Object> mapKeyValue) {
        List<DBObject> dbObject = findKeyValue(mapKeyValue);

        List<Person> persons = new ArrayList<Person>();

        for (DBObject dbo : dbObject) {
            Person person = new PersonConverter().converterToPerson(dbo);

            persons.add(person);
        }

        return persons;
    }
}
