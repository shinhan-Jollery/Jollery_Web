package com.shinhan.like;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.shinhan.VO.ArtsDTO;

@Controller
public class LikeController {
	
	@Autowired
    private LikeService likeService;
	
	@GetMapping("like")
	public String mypageLike(HttpServletRequest request, Model model) {
		
		int userId = (int) request.getAttribute("userId");
        String memberName = (String) request.getAttribute("Member_name");
        model.addAttribute("userId", userId);
        model.addAttribute("memberName", memberName);
        List<ArtsDTO> likedArts = likeService.getLikedArts(userId);
        model.addAttribute("likedArts", likedArts);
        return "like/like";
	}
}
