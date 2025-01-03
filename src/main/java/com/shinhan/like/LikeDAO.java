package com.shinhan.like;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.LikesDTO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.shinhan.like";
	
	public void insertLike(LikesDTO likesDTO) {
		sqlSession.insert(namespace + ".insertLike", likesDTO);
	}
	
	public void deleteLike(LikesDTO likesDTO) {
		sqlSession.delete(namespace + ".deleteLike", likesDTO);
	}
	
	public boolean isLiked(LikesDTO likesDTO) {
		int count = sqlSession.selectOne(namespace + ".selectLike", likesDTO);
		return count > 0;
	}
	
	public List<ArtsDTO> getLikedArts(int memberId) {
	    return sqlSession.selectList(namespace + ".getLikedArts", memberId);
	}
}
