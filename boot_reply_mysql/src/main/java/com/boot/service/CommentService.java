package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.CommentDTO;

public interface CommentService {
	public ArrayList<CommentDTO> findAll(HashMap<String, String> param);

	public void save(HashMap<String, String> param);
}
