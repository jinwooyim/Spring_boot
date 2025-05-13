package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.NoticeCommentDTO;

public interface NoticeCommentService {
	public void save(HashMap<String, String> param);

	public ArrayList<NoticeCommentDTO> findAll(HashMap<String, String> param);
}
