package com.boot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@ResponseBody
public class DemoController {
//	@ResponseBody
	@RequestMapping("/")
	public String home() {
		log.info("Boot Gradle~!!!");

//		return "gradle";
		return "hello";
	}

	@RequestMapping("/hello.do")
	public String hello() {
		log.info("안녕하세요");

		return "hello";
	}
}
