package com.shinhan.like;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LikeController {
	@GetMapping("like.do")
	public String mypageLike() {
		return "like/like";
	}
}
