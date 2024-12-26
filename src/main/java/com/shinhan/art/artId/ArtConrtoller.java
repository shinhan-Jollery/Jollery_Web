package com.shinhan.art.artId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.VO.ArtsDTO;

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
	
	@PostMapping(value="/art",
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces="text/plain;charset=utf-8")
	public String insert(@RequestBody ArtsDTO art) {
		int result = artService.insertService(art);
		return result > 0 ? "등록 성공" : "등록 실패";
	}
	
	@GetMapping(value = "/art/{artid}/update", produces = "text/plain;charset=utf-8")
	public String updatePage() {
		return "수정";
	}
	
	@PutMapping(value="/art/{artid}", 
			consumes=MediaType.APPLICATION_JSON_VALUE,
			produces="text/plain;charset=utf-8")
	public String update(@RequestBody ArtsDTO art) {
		int result = artService.updateService(art);
		return result > 0 ? "수정 성공" : "수정 실패";
	}

	@DeleteMapping(value = "/art/{artid}", 
			produces = "text/plain;charset=utf-8")
	public String delete(@PathVariable int art_id) {
		int result = artService.deleteService(art_id);
		return result > 0 ? "삭제 성공" : "삭제 실패";
	}

}
