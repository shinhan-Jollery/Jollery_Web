package com.shinhan.art.artId;

import com.shinhan.VO.ArtsDTO;

public interface ArtDAOInterface {
	
	public ArtsDTO selectByArtId(int art_id);
	
	public int insert(ArtsDTO art);

	public int update(ArtsDTO art);

	public int delete(int art_id);
}
