package org.sara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sara.domain.ReplyVO;
import org.sara.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/replies/")
public class Replycontroller {
	private ReplyService service;

	@PostMapping(value = "new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO: " + vo);

		int insertCount = service.register(vo);
		log.info("Reply INSERT COUNT:" + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{books_id_id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })

	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page,
			@PathVariable("books_id_id") int books_id_id) {
		log.info("getList.............");

		int pageSize = 5;
	

		List<ReplyVO> replyList = service.getListWithPaging(books_id_id, page, pageSize);

		// Construct a map with both replyList and totalPages
		Map<String, Object> responseMap = new HashMap<>();
		responseMap.put("list", replyList);
		responseMap.put("totalPages", (int) Math.ceil((double) service.countReplies(books_id_id) / pageSize));
		responseMap.put("currentPage", page);
		log.info(replyList);
		log.info(service.countReplies(books_id_id));
	
		return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}

	@GetMapping(value = "/{reply_id}", // 댓글조회
			produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("reply_id") int reply_id) {
		log.info("get: " + reply_id);
		return new ResponseEntity<>(service.get(reply_id), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{reply_id}", // 댓글삭제
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("reply_id") int reply_id) {
		log.info("remove : " + reply_id);

		return service.remove(reply_id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reply_id}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("reply_id") int reply_id) {
		log.info("Update");
		vo.setReply_id(reply_id);

		log.info("reply_id :" + reply_id);
		log.info("modify :" + vo);

		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
