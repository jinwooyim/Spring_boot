package com.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boot.dto.TicketDTO;
import com.boot.service.TicketService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TicketController {

	@Autowired
	private TicketService service;

	@RequestMapping("/buy_ticket")
	public String buy_ticket() {
		log.info("@# buy_ticket()");
		return "buy_ticket";
	}

	@RequestMapping("/buy_ticket_card")
	public String buy_ticket_card(TicketDTO ticketDTO, Model model) {
		log.info("@# buy_ticket_card ticketDTO =>" + ticketDTO);

		service.buyTicket(ticketDTO);
		model.addAttribute("ticketInfo", ticketDTO);

		return "buy_ticket_end";
	}
}
