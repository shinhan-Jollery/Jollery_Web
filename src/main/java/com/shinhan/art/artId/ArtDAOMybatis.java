package com.shinhan.art.artId;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.CategoriesDTO;
import com.shinhan.VO.MiniCategoriesDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ArtDAOMybatis implements ArtDAOInterface {
	@Autowired
	SqlSession sqlSession;

	String namespace = "com.shinhan.art.";

	// 카테고리 조회
	public List<CategoriesDTO> selectAllCategory() {
		List<CategoriesDTO> categorylist = sqlSession.selectList("com.shinhan.category.selectAllCategory");
		return categorylist;
	}

	// 미니 카테고리 조회
	public List<MiniCategoriesDTO> selectAllMiniCategory(int categoryId) {
		List<MiniCategoriesDTO> minicategorylist = sqlSession.selectList("com.shinhan.miniCategory.selectAllMiniCategory", categoryId);
		return minicategorylist;
	}

	// 작품 등록
	@Override
	public int insert(ArtsDTO art) {
		int result = sqlSession.insert(namespace + "insert", art);
		log.info(result + "건 입력됨");
		return result;
	}

	// 작품 수정
	@Override
	public int update(ArtsDTO art) {
		int result = sqlSession.update(namespace + "update", art);
		log.info(result + "건 수정됨");
		return result;
	}

	// 작품 삭제
	@Override
	public int delete(int art_id) {
		int result = sqlSession.delete(namespace + "delete", art_id);
		log.info(result + "건 삭제됨");
		return result;
	}

	// 작품 상세
	@Override
	public ArtsDTO selectByArtId(int art_id) {
		ArtsDTO art = sqlSession.selectOne(namespace + "selectById", art_id);

		return art;
	}

}
