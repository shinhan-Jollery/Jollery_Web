package com.shinhan.mavenProject.section6;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("di6.xml");

		DeptService dService = ctx.getBean("deptService", DeptService.class);
		List<DeptDTO> deptList = dService.selectAllService();

		for (DeptDTO dept : deptList) {
			System.out.println(dept);
		}

	}
}
