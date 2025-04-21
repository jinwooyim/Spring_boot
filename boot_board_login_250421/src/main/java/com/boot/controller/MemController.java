package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.MemDTO;
import com.boot.service.MemService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	@Autowired
	private MemService service;

	@RequestMapping("/login")
	public String login(Model model) {
		log.info("@# login()");

		return "login";
	}

	@RequestMapping("/")
	public String home(Model model) {
		log.info("@# login()");

		return "login";
	}

	@RequestMapping("/login_yn")
	public String loginYn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# loginYn()");

		HttpSession session = request.getSession();
		MemDTO dto = new MemDTO(param.get("mem_uid"), param.get("mem_pwd"), param.get("mem_name"));
		ArrayList<MemDTO> dtos = service.loginYn(param);

		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
//			if (request.getParameter("mem_pwd").equals(dtos.get(0).getMem_pwd())) {
			if (param.get("mem_pwd").equals(dtos.get(0).getMem_pwd())) {
//				로그인 성공시 사용자정보를 세션에 저장
				session.setAttribute("user", dto);
				MemDTO mdto = (MemDTO) session.getAttribute("user");
				log.info("@# mdto =>" + mdto);
				session.setMaxInactiveInterval(3600);
				return "redirect:list";
			}
			return "redirect:login";
		}
	}

	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@# login_ok()");

		return "login_ok";
	}

	@RequestMapping("/register")
	public String register() {
		log.info("@# register()");

		return "register";
	}

	@RequestMapping("/registerOk")
	public String registerOk(@RequestParam HashMap<String, String> param) {
		log.info("@# registerOk()");

		service.write(param);

		return "redirect:login";
	}

}
