package com.shinhan.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ExhibitionsDTO;

@Service
public class ExhibitionService {
	@Autowired
	ExhibitionDao exDAO;

	public void insertExhibition(ExhibitionsDTO exhibition) {
		exDAO.insertExhibition(exhibition);
	}
}
