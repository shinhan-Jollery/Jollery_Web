package com.shinhan.main;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {
	@GetMapping("main.do")
	public String mypage(HttpSession session,HttpServletRequest  request) {
		try {
<<<<<<< HEAD
		System.out.println("userID:  "+(int) request.getAttribute("userId"));
		System.out.println("username"+(String) request.getAttribute("Member_name"));
=======
		System.out.println("userID:  " + (int) request.getAttribute("userId"));
		System.out.println("username" + (String) request.getAttribute("Member_name"));
>>>>>>> 31b1c7f0e56a2947946278528b9e6b9196e843ee
		}
		catch(Exception e){
			System.out.println("내가 만든 쿠키~");
		}
		
		return "main/main";
	}
}
