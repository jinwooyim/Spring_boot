package com.boot.service;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.boot.dto.RecipeDTO;

public interface RecipeService {

	// 리스트 상세보기
	public RecipeDTO get_recipe_by_id(int recipeId);

	// 리스트 수정
	public void updateRecipe(HashMap<String, String> param);

	// 리스트 삭제
	public void deleteRecipe(int rc_recipe_id);

	// 최신 리스트 조회
	public RecipeDTO recipe_list();

	// 레시피 등록
	public void insert_recipe(HashMap<String, String> recipeData);

	// 요리 과정 등록
	public void insert_rc_course(@Param("rc_course_description") String rc_course_description);

	// 요리 재료 등록
	public void insert_rc_ingredient(String rc_ingredient_name, String rc_ingredient_amount);
}
