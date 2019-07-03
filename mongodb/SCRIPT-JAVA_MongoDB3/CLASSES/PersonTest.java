package com.javadao.test;


import com.javadao.dao.PersonDao;
import com.javadao.entity.Person;
import com.javadao.entity.Phone;

import java.util.*;

import org.bson.types.ObjectId;


public class PersonTest {

	public static void main(String[] args) 
	{
		 save();
	     // update();
	    //  delete();

	}

	    private static void save() 
	    {
	        Phone ph1 = new Phone("021-3222.6598", "021-9145.9966");
	        Person p1 = new Person("Rodrigo", "de Alvarez", 27, ph1);
	        new PersonDao().save(p1);
	
	        Phone ph2 = new Phone("011-3002.0590", "011-9100.9006");
	        Person p2 = new Person("Manoel", "de Souza", 23, ph2);
	        new PersonDao().save(p2);
	
	        Phone ph3 = new Phone("055-3222.2522", "055-9225.4464");
	        Person p3 = new Person("Anita", "Pires de Almeida", 38, ph3);
	        new PersonDao().save(p3);
	
	        List<Person> persons = new PersonDao().findPersons();
	        for (Person person : persons) {
	            System.out.println(person.toString());
	        }
    }

    private static void update() 
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("firstName", "Anita");
        Person query = new PersonDao().findPerson(map);

        Phone phone = new Phone("048-3222.2522", "048-9225.4464");
        Person person = new Person("Anita", "Pires de Almeida", 30, phone);
        new PersonDao().update(query, person);

        Person newPerson = new PersonDao().findPerson(map);
        System.out.printf("Old:> " + query + "\nNew:> " + newPerson.toString());
    }

    private static void delete() 
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("firstName", "Anita");
        List<Person> query = new PersonDao().findPersons(map);
        
        
        for (Person person : query) {
            new PersonDao().delete(person);
        }

        List<Person> persons = new PersonDao().findPersons();
        for (Person person : persons) {
            System.out.println(person.toString());
        }
    } 
	
}
