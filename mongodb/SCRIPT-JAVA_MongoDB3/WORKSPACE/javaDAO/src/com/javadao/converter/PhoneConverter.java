package com.javadao.converter;


import com.mongodb.DBObject;
import com.javadao.entity.Phone;

import java.util.HashMap;
import java.util.Map;

public class PhoneConverter {

	public Map<String, Object> converterToMap(Phone phone) {
        Map<String, Object> mapPhone = new HashMap<String, Object>();
        mapPhone.put("phoneNumber", phone.getPhoneNumber());
        mapPhone.put("mobileNumber", phone.getMobileNumber());

        return mapPhone;
    }

    public Phone converterToPhone(HashMap<String, Object> hashMap) {
        Phone phone = new Phone();
        phone.setPhoneNumber((String) hashMap.get("phoneNumber"));
        phone.setMobileNumber((String) hashMap.get("mobileNumber"));

        return phone;
    }
	
}
