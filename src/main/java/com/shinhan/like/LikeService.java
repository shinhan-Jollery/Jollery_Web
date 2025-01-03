package com.shinhan.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.LikesDTO;

@Service
public class LikeService {
	@Autowired
	private LikeDAO likeDAO;
	
	public void insertLike(LikesDTO likesDTO) {
		likeDAO.insertLike(likesDTO);
	}
	
	public void deleteLike(LikesDTO likesDTO) {
		likeDAO.deleteLike(likesDTO);
	}
	
	 // 관심 여부 확인
    public boolean checkIfLiked(LikesDTO likesDTO) {
        return likeDAO.isLiked(likesDTO);
    }

    // 관심 상태 변경
    public boolean toggleLike(LikesDTO likesDTO) {
        boolean isLiked = likeDAO.isLiked(likesDTO);

        if (isLiked) {
            likeDAO.deleteLike(likesDTO);
        } else {
            likeDAO.insertLike(likesDTO);
        }
        return !isLiked; // 변경 후 상태 반환
    }
	
	public List<ArtsDTO> getLikedArts(int memberId) {
	    return likeDAO.getLikedArts(memberId);
	}
}
