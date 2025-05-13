package com.boot.dao;

import java.util.List;

import com.boot.dto.NoticeBoardAttachDTO;

public interface NoticeBoardAttachDAO {
//	파일업로드는 파라미터를 DTO 사용
	public void insertFile(NoticeBoardAttachDTO vo);
	public List<NoticeBoardAttachDTO> getFileList(int boardNo);
	public void deleteFile(String boardNo);
}















