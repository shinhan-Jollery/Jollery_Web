package com.shinhan.mavenProject.section1;

public class LGTV implements TVInterface{
	public void powerOn() {
		System.out.println(getClass().getSimpleName() + "전원을 켠다");
	}

	public void powerOff() {
		System.out.println(getClass().getSimpleName() + "전원을 끈다");
	}

	@Override
	public void turnOn() {
		System.out.println(getClass().getSimpleName() + "전원을 켠다!!!");
	}

	@Override
	public void turnOff() {
		System.out.println(getClass().getSimpleName() + "전원을 끈다!!!");
	}
}
