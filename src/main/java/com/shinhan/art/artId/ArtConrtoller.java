package com.shinhan.art.artId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//@RestController
@Controller
@RequestMapping
public class ArtConrtoller {

	@Autowired
	ArtService artService;

	@GetMapping(value = "/art/insert")
	public String insertPage() {
		return "art/artInsert";
	}

	@GetMapping(value = "/art/{artid}/update", produces = "text/plain;charset=utf-8")
	public String updatePage() {
		return "art/artInsert";
	}

}
