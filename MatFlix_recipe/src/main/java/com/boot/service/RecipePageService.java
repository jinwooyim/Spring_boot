package com.boot.service;

import java.util.ArrayList;

import com.boot.dto.RecipeBoardDTO;
import com.boot.dto.RecipeCriteria;

public interface RecipePageService {
	public ArrayList<RecipeBoardDTO> listWithPaging(RecipeCriteria cri);

	public int totalList(RecipeCriteria cri);
}
