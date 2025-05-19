package com.boot.dao;

import com.boot.dto.TicketDTO;

public interface TicketDAO {
	public void insertCard(TicketDTO ticketDTO); // 카드 결제

	public void insertTicket(TicketDTO ticketDTO); // 티켓 수령
}
