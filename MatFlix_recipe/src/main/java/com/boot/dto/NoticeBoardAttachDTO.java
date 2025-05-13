package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoardAttachDTO {
	private String notice_uuid;
	private String notice_uploadPath;
	private String notice_fileName;
	private boolean notice_image;
	private int notice_boardNo;
}
