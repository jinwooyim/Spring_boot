package com.boot.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.RecipeAttachDAO;
import com.boot.dto.RecipeAttachDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UploadService")
public class UploadServiceImpl implements UploadService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RecipeAttachDTO> getFileList(int rc_recipe_id) {
		log.info("@# UploadServiceImpl boardNo=>" + rc_recipe_id);

		RecipeAttachDAO dao = sqlSession.getMapper(RecipeAttachDAO.class);

		return dao.getFileList(rc_recipe_id);
	}

	// 폴더에 저장된 파일들 삭제
	@Override
	public void deleteFiles(List<RecipeAttachDTO> fileList) {
		log.info("@# deleteFile fileList=>" + fileList);

		if (fileList == null || fileList.size() == 0) {
			return;
		}

		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\develop\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_"
						+ attach.getFileName());
				Files.deleteIfExists(file);

//				썸네일 삭제(이미지인 경우)
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\develop\\upload\\" + attach.getUploadPath() + "\\s_"
							+ attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}

	@Override
	public void insertFile(RecipeAttachDTO filedto) {
		log.info("@# insertFile filedto=>" + filedto);

		RecipeAttachDAO dao = sqlSession.getMapper(RecipeAttachDAO.class);
		dao.insertFile(filedto);
	}

	@Override
	public int getMaxId() {
		RecipeAttachDAO dao = sqlSession.getMapper(RecipeAttachDAO.class);
		int maxId = dao.getMaxId();
		return maxId;
	}

}
