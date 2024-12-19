package com.shinhan.mavenProject.section3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		f2();
	}

	private static void f2() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("di3.xml");
		Person p1 = ctx.getBean("person1", Person.class);
		System.out.println(p1);
	}

	private static void f1() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("di3.xml");
		Car c1 = ctx.getBean("car1", Car.class);
		Car c2 = ctx.getBean("car2", Car.class);
		Car c3 = ctx.getBean("car3", Car.class);
		Car c4 = ctx.getBean("car3", Car.class);
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		System.out.println(c4);
		
	}

}
