package com.shinhan.mavenProject.section7;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("aop7.xml");
		Calculator cal = ctx.getBean("proxyCal", Calculator.class);
		cal.add(10, 30);
	}

}
