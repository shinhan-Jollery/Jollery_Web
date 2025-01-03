package com.shinhan.art.artId;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.CategoriesDTO;
import com.shinhan.VO.MiniCategoriesDTO;

@Service
public class ArtService {
	
	@Autowired
	ArtDAOMybatis artDAO;
	
	public ArtsDTO selectByArtIdService (int art_id) {
		return artDAO.selectByArtId(art_id);
	}
	
	public List<CategoriesDTO> selectAllCategoryService(){
		System.out.println("나와라"+artDAO.selectAllCategory().toString());
		return artDAO.selectAllCategory();
	}
	
	public List<MiniCategoriesDTO> selectAllMiniCategoryService(int categoryId){
		System.out.println("미니미니야"+artDAO.selectAllMiniCategory(categoryId).toString());
		return artDAO.selectAllMiniCategory(categoryId);
	}
	
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
