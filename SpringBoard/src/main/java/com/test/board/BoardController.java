package com.test.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	
	@Autowired
	private IBoardDAO dao;
	
	
	

	//http://localhost:8090/board/board/template.action
	@RequestMapping(value="/board/template.action", method={RequestMethod.GET})
	public String tempalte(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		return "board.template";		
	}
	
	
	
	@RequestMapping(value="/member/auth.action", method={RequestMethod.GET})
	public String auth(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		return "member.auth";		
	}
	
	
	@RequestMapping(value="/member/login.action", method={RequestMethod.GET})
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session, String id) { //1.
		
		//1. 데이터 가져오기(id)
		//2. 인증 티켓 발급
		//3. 페이지 이동
		
		session.setAttribute("id", id); //2.
		
		//3.
		try {
			response.sendRedirect("/board/member/auth.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/member/logout.action", method={RequestMethod.GET})
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		//1. 인증 티켓 폐기
		//2. 페이지 이동
		
		session.removeAttribute("id");
		
		//2.
		try {
			response.sendRedirect("/board/member/auth.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	@RequestMapping(value="/board/list.action", method={RequestMethod.GET})
	public String list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		//1. DB 위임 -> select
		//2. JSP 호출하기
		
		List<BoardDTO> list = dao.list();
		
		request.setAttribute("list", list);
		
		return "board.list";		
	}
	
	
	//http://localhost:8090/board/board/add.action
	@RequestMapping(value="/board/add.action", method={RequestMethod.GET})
	public String add(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		return "board.add";		
	}
	
	@RequestMapping(value="/board/addok.action", method={RequestMethod.POST})
	public void addok(HttpServletRequest request, HttpServletResponse response, HttpSession session, BoardDTO dto) { //1.
		
		//1. 데이터 가져오기
		//2. DAO 위임 -> insert
		//3. 결과 처리
		
		dto.setId((String)session.getAttribute("id"));
		
		int result = dao.add(dto);
		
		//3.
		try {
			if (result == 1) {
				response.sendRedirect("/board/board/list.action");
			} else {
				response.sendRedirect("/board/board/add.action");
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	
	
	@RequestMapping(value="/board/edit.action", method={RequestMethod.GET})
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) { //1.
		 
		//1. 데이터 가져오기(seq)
		//2. DB 위임 -> select
		//3. dto + JSP 호출하기
		
		//2.
		BoardDTO dto = dao.get(seq);
		
		//3.
		request.setAttribute("dto", dto);		
		
		return "board.edit";		
	}
	
	@RequestMapping(value="/board/editok.action", method={RequestMethod.POST})
	public void editok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
				
	}
	
	
	
	
	
	@RequestMapping(value="/board/del.action", method={RequestMethod.GET})
	public String del(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		return "board.del";		
	}
	
	@RequestMapping(value="/board/delok.action", method={RequestMethod.POST})
	public void delok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
				
	}
	
	
	
	
	@RequestMapping(value="/board/view.action", method={RequestMethod.GET})
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) { //1.
		
		//1. 데이터 가져오기(seq)
		//2. DB 위임 -> select
		//3. dto + JSP 호출하기
		
		BoardDTO dto = dao.get(seq);
		
		request.setAttribute("dto", dto);
		
		return "board.view";		
	}
	
}











