package com.shinhan.sale;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ArtsDTO;

@Service
public class SaleListService {
	@Autowired
	SaleListDAO saleListDAO;
	
	public List<ArtsDTO> getArtsByStatus(Integer memberId, String status) {
		return saleListDAO.selectArtsByStatus(memberId, status);
	}
}
