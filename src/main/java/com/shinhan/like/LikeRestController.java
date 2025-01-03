package com.shinhan.like;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.LikesDTO;

@RestController
@RequestMapping("/api/likes")
public class LikeRestController {

    @Autowired
    private LikeService likeService;

    // 좋아요 추가
    @PostMapping("/add")
    public ResponseEntity<String> addLike(@RequestBody HttpServletRequest request, LikesDTO likesDTO) {
        try {
            likeService.insertLike(likesDTO);
            return ResponseEntity.ok("좋아요 추가 성공");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("좋아요 추가 실패");
        }
    }

    // 좋아요 삭제
    @DeleteMapping("/remove")
    public ResponseEntity<String> removeLike(@RequestBody HttpServletRequest request, LikesDTO likesDTO) {
        try {
            likeService.deleteLike(likesDTO);
            return ResponseEntity.ok("좋아요 삭제 성공");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("좋아요 삭제 실패");
        }
    }

    @PostMapping("/check")
    public ResponseEntity<Boolean> checkIfLiked(@RequestBody LikesDTO likesDTO) {
        boolean isLiked = likeService.checkIfLiked(likesDTO);
        return ResponseEntity.ok(isLiked);
    }
    
    @PostMapping("/toggle")
    public ResponseEntity<Boolean> toggleLike(@RequestBody LikesDTO likesDTO) {
        boolean newStatus = likeService.toggleLike(likesDTO);
        return ResponseEntity.ok(newStatus); // 변경된 상태 반환
    }
    
}
