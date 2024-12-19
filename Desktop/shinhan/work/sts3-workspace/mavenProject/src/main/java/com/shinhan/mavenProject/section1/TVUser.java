package com.shinhan.mavenProject.section1;

public class TVUser {
	public static void main(String[] args) {
		f3();
	}

	private static void f1() {
		SamsungTV tv = new SamsungTV("갤레기");
		tv.turnOn();
		tv.turnOff();
	}
	
	private static void f2() {
		LGTV tv = new LGTV();
		tv.powerOn();
		tv.powerOff();
	}
	
	private static void f3() {
		TVInterface tv1 = TVFactory.makeTV("Samsung");
		tv1.turnOn();
		tv1.turnOff();
		
		TVInterface tv2 = TVFactory.makeTV("LG");
		tv2.turnOn();
		tv2.turnOff();
	}
	
}
