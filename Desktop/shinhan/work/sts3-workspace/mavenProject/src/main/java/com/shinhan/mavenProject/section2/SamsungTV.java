package com.shinhan.mavenProject.section2;

public class SamsungTV implements TVInterface {
	
	String model;
	
	public SamsungTV(String model) {
		System.out.println("samsungTV 생성자");
		this.model = model;
	}
	
	public String getModel() {
		System.out.println("samsungTV getModel");
		return model;
	}

	public void setModel(String model) {
		System.out.println("samsungTV setModel");
		this.model = model;
	}



	public void turnOn() {
		System.out.println(getClass().getSimpleName() + "전원을 켠다");
	}
	
	public void turnOff() {
		System.out.println(getClass().getSimpleName() + "전원을 끈다");
	}
}
