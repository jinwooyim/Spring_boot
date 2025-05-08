package com.boot.dao;

import java.util.List;

import com.boot.dto.RecipeAttachDTO;

public interface RecipeAttachDAO {
//	파일업로드는 파라미터를 DTO 사용
	public List<RecipeAttachDTO> getFileList(int rc_recipe_id);

	public void deleteFile(String rc_recipe_id);

	public void insertFile(RecipeAttachDTO filedto);

	public int getMaxId();
}
