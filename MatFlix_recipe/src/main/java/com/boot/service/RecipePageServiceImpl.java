package com.boot.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.RecipePageDAO;
import com.boot.dto.RecipeBoardDTO;
import com.boot.dto.RecipeCriteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class RecipePageServiceImpl implements RecipePageService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<RecipeBoardDTO> listWithPaging(RecipeCriteria cri) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri" + cri);

		RecipePageDAO dao = sqlSession.getMapper(RecipePageDAO.class);
		ArrayList<RecipeBoardDTO> list = dao.listWithPaging(cri);

		return list;
	}

	@Override
	public int totalList(RecipeCriteria cri) {
		log.info("@# PageServiceImpl totalList");
		RecipePageDAO dao = sqlSession.getMapper(RecipePageDAO.class);
		int totalList = dao.totalList(cri);
		return totalList;
	}

}
