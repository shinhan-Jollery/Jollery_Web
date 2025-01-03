package com.shinhan.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.ExhibitionsDTO;

@RestController
public class ExhibitionSQLTestController {

	@Autowired
	ExhibitionService service;
	
	@GetMapping("/aa")
	public String name() {
		ExhibitionsDTO ex = new ExhibitionsDTO();
		ex.setExhibition_id(999);
		ex.setExhibition_title("����123");
		ex.setExhibition_univ("���Ѵ��б�3");
		ex.setExhibition_major("���Ұ�");
		ex.setExhibition_location("����");
		ex.setExhibition_link("��ũ");
		ex.setExhibition_poster("������");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsedDate;
		try {
			parsedDate = dateFormat.parse("2024-02-23");
			ex.setExhibition_start_date(new java.sql.Date(parsedDate.getTime()));
			ex.setExhibition_end_date(new java.sql.Date(parsedDate.getTime()));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		service.insertExhibition(ex);
		System.out.println(1);
		return "aa";
	}
}
