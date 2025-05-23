package com.boot.service;

import java.util.ArrayList;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;

public interface PageService {
	public ArrayList<BoardDTO> listWithPaging(Criteria cri);

	public int totalList(Criteria cri);
}
