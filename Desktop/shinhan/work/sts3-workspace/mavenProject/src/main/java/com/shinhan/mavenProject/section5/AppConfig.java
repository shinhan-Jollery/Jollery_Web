package com.shinhan.mavenProject.section5;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.shinhan.mavenProject.section4.CarVO;

@Configuration
@ComponentScan
public class AppConfig {
	@Bean
	public CarVO getCar() {
		return new CarVO("ABC", 1000, "black");
	}
	
}
