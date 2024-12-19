package com.shinhan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        // Spring 컨텍스트 로드
    	ApplicationContext context = new ClassPathXmlApplicationContext("application-context.xml");

        // CityDao 빈 가져오기
        CityDao cityDao = context.getBean("cityDao", CityDao.class);

        // 데이터 조회 및 출력
        List<City> cities = cityDao.getAllCities();
        for (City city : cities) {
            System.out.println(city.getName() + " - " + city.getCountryCode());
        }
    }
}
