package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeCommentDTO {
	private int notice_commentNo;
	private String notice_commentWriter;
	private String notice_commentContent;
	private int notice_boardNo;
	private Timestamp notice_commentCreatedTime;
}
