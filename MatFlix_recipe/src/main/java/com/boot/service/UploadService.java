package com.boot.service;

import java.util.List;

import com.boot.dto.RecipeAttachDTO;

public interface UploadService {
	public List<RecipeAttachDTO> getFileList(int rc_recipe_id);

	public void insertFile(RecipeAttachDTO filedto);

	public void deleteFiles(List<RecipeAttachDTO> fileList);

	public int getMaxId();
}
