package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.NoticeCommentDAO;
import com.boot.dto.NoticeCommentDTO;

@Service("NoticeCommentService")
public class NoticeCommentServiceImpl implements NoticeCommentService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void save(HashMap<String, String> param) {
		NoticeCommentDAO dao = sqlSession.getMapper(NoticeCommentDAO.class);
		dao.save(param);
	}

	@Override
	public ArrayList<NoticeCommentDTO> findAll(HashMap<String, String> param) {
		NoticeCommentDAO dao = sqlSession.getMapper(NoticeCommentDAO.class);
		ArrayList<NoticeCommentDTO> list = dao.findAll(param);
		return list;
	}

}
