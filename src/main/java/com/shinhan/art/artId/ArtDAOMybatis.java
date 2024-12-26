package com.shinhan.art.artId;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ArtsDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ArtDAOMybatis implements ArtDAOInterface {
	@Autowired
	SqlSession sqlSession;

	String namespace = "com.shinhan.art.";

	// ��ǰ ���
	@Override
	public int insert(ArtsDTO art) {
		int result = sqlSession.insert(namespace + "insertArt", art);
		log.info(result + "�� �Էµ�");
		return result;
	}

	// ��ǰ ����
	@Override
	public int update(ArtsDTO art) {
		int result = sqlSession.update(namespace + "updateArt", art);
		log.info(result + "�� ������");
		return result;
	}

	// ��ǰ ����
	@Override
	public int delete(int art_id) {
		int result = sqlSession.delete(namespace + "deleteArt", art_id);
		log.info(result + "�� ������");
		return result;
	}

//	@Override
//	public ArtsDTO selectByArtId(int art_id) {
//		ArtsDTO art = sqlSession.selectOne(namespace + "selectById", art_id);
//		
//		return art;
//	}
}
