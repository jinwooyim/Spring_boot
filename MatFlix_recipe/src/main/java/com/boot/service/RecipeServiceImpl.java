package com.boot.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.RecipeDAO;
import com.boot.dto.RecipeDTO;

@Service
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private SqlSession session;

	// 요리 등록
	@Override
	public void insert_recipe(HashMap<String, String> recipeData) {
		RecipeDAO dao = session.getMapper(RecipeDAO.class);
		dao.insert_recipe(recipeData);
	}

	@Override
	public RecipeDTO get_recipe_by_id(int recipeId) {
		try {
			RecipeDAO dao = session.getMapper(RecipeDAO.class);
			RecipeDTO recipe = dao.get_recipe_by_id(recipeId);
			if (recipe == null) {
			}
			return recipe;
		} catch (Exception e) {
			throw new RuntimeException("레시피 상세 조회 실패: 데이터베이스 오류", e);
		}
	}

	@Override
	public void updateRecipe(HashMap<String, String> param) {
		try {
			RecipeDAO dao = session.getMapper(RecipeDAO.class);
			dao.updateRecipe(param);
		} catch (Exception e) {
			throw new RuntimeException("레시피 수정 실패: 데이터베이스 오류", e);
		}
	}

	@Override
	public void deleteRecipe(int rc_recipe_id) {
		try {
			RecipeDAO dao = session.getMapper(RecipeDAO.class);
			dao.deleteRecipe(rc_recipe_id); // int 타입 그대로 전달
		} catch (Exception e) {
			throw new RuntimeException("레시피 삭제 실패: 데이터베이스 오류", e);
		}
	}

	@Override
	public RecipeDTO recipe_list() {
		RecipeDAO dao = session.getMapper(RecipeDAO.class);
		RecipeDTO dto = dao.recipe_list();
		return dto;
	}

	@Override
	public void insert_rc_course(String rc_course_description) {
		RecipeDAO dao = session.getMapper(RecipeDAO.class);
		dao.insert_rc_course(rc_course_description);
	}

	@Override
	public void insert_rc_ingredient(String rc_ingredient_name, String rc_ingredient_amount) {
		RecipeDAO dao = session.getMapper(RecipeDAO.class);
		dao.insert_rc_ingredient(rc_ingredient_name, rc_ingredient_amount);
	}

}
