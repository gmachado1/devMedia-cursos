package com.javadao.entity;


import java.io.Serializable;

public class Person implements Serializable {
    private String id;
    private String firstName;
    private String lastName;
    private int age;
    private Phone phone;

    public Person() {
        super();
    }

    public Person(String firstName, String lastName, int age, Phone phone) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
    }

    //Gere os metodos get/set

    @Override
    public String toString() {
        return "Person{" +
                "id='" + id + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", age=" + age +
                ", phone=" + phone +
                '}';
    }
    
    
    public String getId() {
    	return this.id;
    }
    
    public void setId(String i) {
    	this.id = i;
    }
    
    
    public String getFirstName() {
    	return this.firstName;
    }
    
    public void setFirstName(String f) {
    	this.firstName = f;
    }
    
    
    public String getLastName() {
    	return this.lastName;
    }
    
    public void setLastName(String l) {
    	this.lastName = l;
    }
    
    
    public int getAge() {
    	return this.age;
    }
    
    public void setAge(int a) {
    	this.age = a;
    }
    
    public Phone getPhone() {
    	return this.phone;
    }
    
    public void setPhone(Phone p) {
    	this.phone = p;
    }
    
       

}
