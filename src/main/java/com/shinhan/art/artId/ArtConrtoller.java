package com.shinhan.art.artId;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.VO.CategoriesDTO;
import com.shinhan.VO.MiniCategoriesDTO;

//@RestController
@Controller
@RequestMapping
public class ArtConrtoller {

	@Autowired
	ArtService artService;
	
	@GetMapping(value = "/art/insert")
	public String insertPage(Model model) {
        List<CategoriesDTO> categories = artService.selectAllCategoryService();
        System.out.println(categories);
        model.addAttribute("categories", categories);
		return "art/artInsert";
	}

	@GetMapping(value = "/art/{artid}/update", produces = "text/plain;charset=utf-8")
	public String updatePage() {
		return "art/artInsert";
	}
	
	@GetMapping(value = "/art/detail")
	public String detailPage() {
		return "art/artDetail";
	}
	

}
