package com.shinhan.mavenProject.section1;

public class TVFactory {
	
	public static TVInterface makeTV(String brand) {
		if(brand.equals("Samsung"))
			return new SamsungTV("갤럭시");
		else
			return new LGTV();
	}
	
}
