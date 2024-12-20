package com.shinhan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        // Spring 컨텍스트 로드
        ApplicationContext context = new ClassPathXmlApplicationContext("application-context.xml");

        // ExhibitionDao 빈 가져오기
        ExhibitionDao exhibitionDao = context.getBean("exhibitionDao", ExhibitionDao.class);

        // 데이터 조회 및 출력
        List<Exhibition> exhibitions = exhibitionDao.getAllExhibitions();
        for (Exhibition exhibition : exhibitions) {
            System.out.println("Title: " + exhibition.getExhibitionTitle());
            System.out.println("University: " + exhibition.getExhibitionUniv());
            System.out.println("Major: " + exhibition.getExhibitionMajor());
            System.out.println("Location: " + exhibition.getExhibitionLocation());
            System.out.println("Start Date: " + exhibition.getExhibitionStartDate());
            System.out.println("End Date: " + exhibition.getExhibitionEndDate());
            System.out.println("Link: " + exhibition.getExhibitionLink());
            System.out.println("-----------------------------------");
        }
    }
}
