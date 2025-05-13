package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.NoticeBoardAttachDAO;
import com.boot.dao.NoticeBoardDAO;
import com.boot.dto.NoticeBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("NoticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<NoticeBoardDTO> list() {
		NoticeBoardDAO dao = sqlSession.getMapper(NoticeBoardDAO.class);
		ArrayList<NoticeBoardDTO> list = dao.list();
		return list;
	}

	@Override
//	public void write(HashMap<String, String> param) {
//	파일업로드는 파라미터를 DTO 사용
	public void write(NoticeBoardDTO boardDTO) {
		log.info("@# BoardServiceImpl boardDTO=>" + boardDTO);

		NoticeBoardDAO dao = sqlSession.getMapper(NoticeBoardDAO.class);
		NoticeBoardAttachDAO adao = sqlSession.getMapper(NoticeBoardAttachDAO.class);

//		dao.write(param);
		dao.write(boardDTO);

//		첨부파일 있는지 체크
		log.info("@# getAttachList=>" + boardDTO.getNotice_attachList());
		if (boardDTO.getNotice_attachList() == null || boardDTO.getNotice_attachList().size() == 0) {
			log.info("@# null");
			return;
		}

//		첨부파일이 있는 경우 처리
		boardDTO.getNotice_attachList().forEach(attach -> {
			attach.setNotice_boardNo(boardDTO.getNotice_boardNo());
			adao.insertFile(attach);
		});
	}

	@Override
	public NoticeBoardDTO contentView(HashMap<String, String> param) {
		NoticeBoardDAO dao = sqlSession.getMapper(NoticeBoardDAO.class);
		NoticeBoardDTO dto = dao.contentView(param);

		return dto;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		NoticeBoardDAO dao = sqlSession.getMapper(NoticeBoardDAO.class);
		dao.modify(param);
	}

	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# delete param=>" + param);

		NoticeBoardDAO dao = sqlSession.getMapper(NoticeBoardDAO.class);
		NoticeBoardAttachDAO attachDAO = sqlSession.getMapper(NoticeBoardAttachDAO.class);

//		게시글 삭제
		dao.delete(param);
//		댓글 삭제
		attachDAO.deleteFile(param.get("boardNo"));
	}

}
