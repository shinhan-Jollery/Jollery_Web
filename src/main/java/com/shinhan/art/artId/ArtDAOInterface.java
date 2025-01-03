package com.shinhan.art.artId;

import java.util.List;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.CategoriesDTO;
import com.shinhan.VO.MiniCategoriesDTO;

public interface ArtDAOInterface {

	public ArtsDTO selectByArtId(int art_id);

	public List<CategoriesDTO> selectAllCategory();
	
	public List<MiniCategoriesDTO> selectAllMiniCategory(int categoryId);

	public int insert(ArtsDTO art);

	public int update(ArtsDTO art);

	public int delete(int art_id);
}
