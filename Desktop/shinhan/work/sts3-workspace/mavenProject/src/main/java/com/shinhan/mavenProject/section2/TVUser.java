package com.shinhan.mavenProject.section2;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class TVUser {
	public static void main(String[] args) {
		f2();
	}

	private static void f2() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("di2.xml");
		TVInterface tv1 = ctx.getBean("samsung", TVInterface.class);
		tv1.turnOn();
		tv1.turnOff();
		
		TVInterface tv2 = ctx.getBean("lg", LGTV.class);
		tv2.turnOn();
		tv2.turnOff();
	}

	private static void f1() {
		Resource resource = new ClassPathResource("di2.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		TVInterface tv = (TVInterface)factory.getBean("samsung");
		tv.turnOn();
		tv.turnOff();
	}
	
}
