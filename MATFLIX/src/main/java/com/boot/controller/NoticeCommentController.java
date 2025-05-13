package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boot.dto.NoticeCommentDTO;
import com.boot.service.NoticeCommentService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice_comment")
public class NoticeCommentController {
	@Autowired
	private NoticeCommentService service;

	@RequestMapping("/notice_save")
//	public String save(@RequestParam HashMap<String, String> param) {
//	public ArrayList<CommentDTO> save(@RequestParam HashMap<String, String> param) {
	public @ResponseBody ArrayList<NoticeCommentDTO> save(@RequestParam HashMap<String, String> param) {
		log.info("@# save()");
		log.info("@# param=>" + param);

		service.save(param);

		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<NoticeCommentDTO> commentList = service.findAll(param);
//		return null;
		return commentList;
	}

}
