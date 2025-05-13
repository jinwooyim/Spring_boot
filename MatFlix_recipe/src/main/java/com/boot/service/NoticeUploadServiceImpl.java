package com.boot.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.NoticeBoardAttachDAO;
import com.boot.dto.NoticeBoardAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("NoticeUploadService")
public class NoticeUploadServiceImpl implements NoticeUploadService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeBoardAttachDTO> getFileList(int boardNo) {
		log.info("@# UploadServiceImpl boardNo=>" + boardNo);

		NoticeBoardAttachDAO dao = sqlSession.getMapper(NoticeBoardAttachDAO.class);

		return dao.getFileList(boardNo);
	}

	// 폴더에 저장된 파일들 삭제
	@Override
	public void deleteFiles(List<NoticeBoardAttachDTO> fileList) {
		log.info("@# deleteFile fileList=>" + fileList);

		if (fileList == null || fileList.size() == 0) {
			return;
		}

		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\develop\\upload\\" + attach.getNotice_uploadPath() + "\\"
						+ attach.getNotice_uuid() + "_" + attach.getNotice_fileName());
				Files.deleteIfExists(file);

//				썸네일 삭제(이미지인 경우)
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\develop\\upload\\" + attach.getNotice_uploadPath() + "\\s_"
							+ attach.getNotice_uuid() + "_" + attach.getNotice_fileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}

}
