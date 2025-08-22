package com.pritam44.Todo_management.hello_controllar;

import org.springframework.stereotype.Service;

@Service
public class Athentication {
	public static boolean athenticate(String email,String pass) {
		boolean validEmail = email.equalsIgnoreCase("pritammandal@gmail.com");
		boolean vaildPass = pass.equalsIgnoreCase("pritam");
		
		return validEmail && vaildPass;
	}

}
