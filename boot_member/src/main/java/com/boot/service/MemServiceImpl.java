package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.MemDAO;
import com.boot.dto.MemDTO;

@Service("MemService")
public class MemServiceImpl implements MemService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<MemDTO> loginYn(HashMap<String, String> param) {
		MemDAO dao = sqlSession.getMapper(MemDAO.class);
		ArrayList<MemDTO> list = dao.loginYn(param);

		return list;

		/*
		 * Map<String, Object> map = model.asMap(); HttpServletRequest request =
		 * (HttpServletRequest) map.get("request");
		 * 
		 * String mId = request.getParameter("mem_uid"); String mPw =
		 * request.getParameter("mem_pwd"); int re;
		 * 
		 * MemDAO dao=new MemDAO(); // int re = dao.loginYn(mId, mPw); ArrayList<MemDTO>
		 * dtos = dao.loginYn(mId, mPw);
		 * 
		 * if (dtos.isEmpty()) { re=-1; } else { if
		 * (mPw.equals(dtos.get(0).getMem_pwd())) { re=1; } else { re=0; } } // 컨트롤러에 re
		 * 전달(0,1,-1 중에서) return re;
		 */
	}

	@Override
	public void write(HashMap<String, String> param) {
		MemDAO dao = sqlSession.getMapper(MemDAO.class);
		dao.write(param);
	}

}
