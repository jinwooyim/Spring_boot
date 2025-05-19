package com.boot.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.dao.TicketDAO;
import com.boot.dto.TicketDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("TicketService")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public void buyTicket(TicketDTO ticketDTO) {
		log.info("@# TicketServiceImpl TicketDTO => " + ticketDTO);

		TicketDAO dao = sqlSession.getMapper(TicketDAO.class);
		dao.insertCard(ticketDTO);
		dao.insertTicket(ticketDTO);
	}

}
