package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TicketDTO {
// TABLE card
	private String consumerId; // 고객아이디
	private int amount; // 수량

// TABLE ticket
	private int countnum; // 갯수
}
