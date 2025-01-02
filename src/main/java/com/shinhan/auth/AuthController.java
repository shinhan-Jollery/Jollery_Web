package com.shinhan.auth;

<<<<<<< HEAD
=======
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

>>>>>>> 21eab82773897ffca19201b2b0c1af76baece59d
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthController {
	// 나중에 mypage는 따로 빼고 필터로 로그인 상태인데
	// auth 접근 하면 마이페이지나 메인 페이지로 다튕기게 해서 이중 로그인 막기
	@GetMapping("mypage.do")
	public String mypage() {
		return "auth/mypage";
	}

	@GetMapping("mypageSeller.do")
	public String mypageSeller() {
		return "auth/mypageSeller";
	}

	@GetMapping("/signup")
	public String signup(HttpSession session, HttpServletRequest request, Model model) {
		int userId = (int) request.getAttribute("userId");
		String memberName = (String) request.getAttribute("Member_name");
		model.addAttribute("userId", userId);
		model.addAttribute("memberName", memberName);
		return "auth/signup";
	}

	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}

}
