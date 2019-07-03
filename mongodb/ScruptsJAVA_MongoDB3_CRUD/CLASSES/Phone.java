package com.javadao.entity;

public class Phone {

	private String phoneNumber;
    private String mobileNumber;

    public Phone() {
        super();
    }

    public Phone(String phoneNumber, String mobileNumber) {
        this.phoneNumber = phoneNumber;
        this.mobileNumber = mobileNumber;
    }

    //Gere os metodos get/set      

    @Override
    public String toString() {
        return "Phone{" +
                "phoneNumber='" + phoneNumber + '\'' +
                ", mobileNumber='" + mobileNumber + '\'' +
                '}';
    }

    
    public String getPhoneNumber() {
    	return this.phoneNumber;
    }
    
    public void setPhoneNumber(String p) {
    	this.phoneNumber = p;
    }
    
    
    public String getMobileNumber() {
    	return this.mobileNumber;
    }
    
    public void setMobileNumber(String m) {
    	this.mobileNumber = m;
    }
    
    
}
