package com.boot.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.RecipeDTO;

public interface RecipeDAO {
	// 요리 등록
	public void insert_recipe(HashMap<String, String> recipeData);

	// 요리 과정 등록
	public void insert_rc_course(@Param("rc_course_description") String rc_course_description);

	// 요리 재료 등록
	public void insert_rc_ingredient(@Param("rc_ingredient_name") String rc_ingredient_name,
			@Param("rc_ingredient_amount") String rc_ingredient_amount);

	// 리스트 보기
	public RecipeDTO recipe_list();

	// 리스트 상세보기
	public RecipeDTO get_recipe_by_id(int recipeId);

	// 리스트 수정
	public void updateRecipe(HashMap<String, String> param);

	// 리스트 삭제
	public void deleteRecipe(int rc_recipe_id);

}
