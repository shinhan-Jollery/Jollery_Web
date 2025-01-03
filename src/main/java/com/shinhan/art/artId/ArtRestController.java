package com.shinhan.art.artId;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.ArtsDTO;
import com.shinhan.VO.MiniCategoriesDTO;

@RestController
@RequestMapping("/art")
public class ArtRestController {
	@Autowired
	private ArtService artService;

	// 미니 카테고리 조회
	@GetMapping(value = "/api/insert", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MiniCategoriesDTO> selectmini(Integer category_id) {
		// int categoryId =Integer.parseInt(request.get("category_id"));
		return artService.selectAllMiniCategoryService(category_id);
	}

	@PostMapping(value = "/insert", consumes = MediaType.APPLICATION_JSON_VALUE, produces = "text/plain;charset=utf-8")
	public Map<String, Object> insert(@RequestBody Map<String, String> request) {
		int mini_category_id = Integer.parseInt(request.get("subcategory"));
		String art_title = request.get("title");
		int price = Integer.parseInt(request.get("price"));
		String art_size = request.get("size");
		System.out.println(request.toString());
		ArtsDTO art = new ArtsDTO();
		art.setMini_category_ID(mini_category_id);
		art.setArt_title(art_title);
		art.setArt_price(price);
		art.setArt_size(art_size);
		int result = artService.insertService(art);
		Map<String, Object> response = new HashMap<String, Object>();
		if (result > 0) {
			response.put("message", "등록성공");
			response.put("status", "success");
		} else {
			response.put("message", "등록실패");
			response.put("status", "error");
		}
		System.out.println(response);

		return response;

	}

	@PutMapping(value = "/{artid}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = "text/plain;charset=utf-8")
	public String update(@RequestBody ArtsDTO art) {
		int result = artService.updateService(art);

		return result > 0 ? "수정 성공" : "수정 실패";
	}

	@DeleteMapping(value = "/{artid}", produces = "text/plain;charset=utf-8")
	public String delete(@PathVariable int art_id) {
		int result = artService.deleteService(art_id);
		return result > 0 ? "삭제 성공" : "삭제 실패";
	}
}
