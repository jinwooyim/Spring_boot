package com.boot.service;

import java.util.List;

import com.boot.dto.NoticeBoardAttachDTO;

public interface NoticeUploadService {
	public List<NoticeBoardAttachDTO> getFileList(int boardNo);

	public void deleteFiles(List<NoticeBoardAttachDTO> fileList);
}
