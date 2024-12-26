package com.shinhan.art.artId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ArtsDTO;

@Service
public class ArtService {
	
	@Autowired
	ArtDAOMybatis artDAO;
	
	public int insertService (ArtsDTO art) {
		return artDAO.insert(art);
	}
	
	public int updateService (ArtsDTO art) {
		return artDAO.update(art);
	}
	
	public int deleteService (int art_id) {
		return artDAO.delete(art_id);
	}
	
}
