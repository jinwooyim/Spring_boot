package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.NoticeBoardAttachDTO;
import com.boot.dto.NoticeBoardDTO;
import com.boot.dto.NoticeCommentDTO;
import com.boot.service.NoticeBoardService;
import com.boot.service.NoticeCommentService;
import com.boot.service.NoticeUploadService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeBoardController {
	@Autowired
	private NoticeBoardService service;

	@Autowired
	private NoticeCommentService commentService;

	@Autowired
	private NoticeUploadService uploadService;

	@RequestMapping("/notice_write")
//	public String write(@RequestParam HashMap<String, String> param) {
	public String write(NoticeBoardDTO boardDTO) {
		log.info("@# write()");
		log.info("@# boardDTO=>" + boardDTO);

		if (boardDTO.getNotice_attachList() != null) {
			boardDTO.getNotice_attachList().forEach(attach -> log.info("@# attach=>" + attach));
		}

//		service.write(param);
		service.write(boardDTO);

		return "redirect:notice_list";
	}

	@RequestMapping("/notice_write_view")
	public String write_view() {
		log.info("@# notice_write_view()");

		return "notice_write_view";
	}

	@RequestMapping("/notice_content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view()");
		log.info("@# param" + param);

		NoticeBoardDTO dto = service.contentView(param);
		model.addAttribute("content_view", dto);

//		content_view.jsp 에서 pageMaker 를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);

		// 해당 게시글에 작성된 댓글 리스트를 가져옴
		ArrayList<NoticeCommentDTO> commentList = commentService.findAll(param);
		model.addAttribute("commentList", commentList);

		return "notice_content_view";
	}

	@RequestMapping("/notice_modify")
	public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# modify()");
		log.info("@# param" + param);

		service.modify(param);

//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가 
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		rttr.addAttribute("boardNo", param.get("boardNo"));

		return "redirect:notice_list";
	}

	@RequestMapping("/notice_delete")
	public String delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# delete()");
		log.info("@# param=>" + param);
		log.info("@# notice_boardNo=>" + param.get("boardNo"));

		List<NoticeBoardAttachDTO> fileList = uploadService.getFileList(Integer.parseInt(param.get("boardNo")));
		log.info("@# fileList=>" + fileList);

		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		rttr.addAttribute("boardNo", param.get("boardNo"));

//		게시글 삭제, 댓글 삭제
		service.delete(param);
//		폴더 삭제
		uploadService.deleteFiles(fileList);

		return "redirect:notice_list";
	}
}
