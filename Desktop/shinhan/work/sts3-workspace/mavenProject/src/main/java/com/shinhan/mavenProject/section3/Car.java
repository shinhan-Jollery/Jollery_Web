package com.shinhan.mavenProject.section3;

import lombok.ToString;

//POJO(Plain Old Java Object): 평범한 오래된 자바 객체
@ToString
public class Car {
	private String model;
	private int price;
	
	public Car() {
		System.out.println("Car default 생성자");
	}
	
	public Car(String model, int price) {
		System.out.println("Car arg2 생성자");
		this.model = model;
		this.price = price;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
