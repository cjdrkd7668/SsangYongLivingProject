package com.test.living.job;

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
public class JobController {

	
	@Autowired
	private IStoryBoardDAO dao; //알바이야기 게시판 관련
	
	@Autowired
	private IRecruitmentDAO rdao; //알바모집공고 관련
	
	@RequestMapping(value="/job/index.action", method={RequestMethod.GET})
	public String index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "job.index";
	}
	
	
	
	@RequestMapping(value="/job/auth.action", method={RequestMethod.GET})
	public String auth(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "job.auth";
	}
	
	
	@RequestMapping(value="/job/login.action", method={RequestMethod.GET})
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session, String memberSeq) {
			
		session.setAttribute("memberSeq", memberSeq);
		//인증수단 
		
		try {
			response.sendRedirect("/living/job/index.action");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="/job/logout.action", method={RequestMethod.GET})
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		session.removeAttribute("memberSeq");
		
		try {
			response.sendRedirect("/living/job/index.action");
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping(value="/job/recruitmentList.action", method={RequestMethod.GET})
	public String recruitmentList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	
		
		List<RecruitmentDTO> list = rdao.recruitmentlist();
		
		request.setAttribute("list", list);
		
		return "job.recruitmentList";
			
	}
	
	
	@RequestMapping(value="/job/recruitmentView.action", method={RequestMethod.GET})
	public String recruitmentView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "job.recruitmentView";
	}
	
	
	@RequestMapping(value="/jobboard/storylist.action", method={RequestMethod.GET})
	public String storylist(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		List<StoryBoardDTO> list = dao.storylist();
		
		request.setAttribute("list", list);
		
		return "jobboard.storylist";
	}
	
	
	@RequestMapping(value="/jobboard/storyview.action", method={RequestMethod.GET})
	public String storyview(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		StoryBoardDTO dto = dao.storyget(seq);
		
		request.setAttribute("dto", dto);
		
		
		return "jobboard.storyview";
	}
	
	
	
	@RequestMapping(value="/jobboard/storyadd.action", method={RequestMethod.GET})
	public String member_storyadd(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		
		
		return "jobboard.storyadd";
	}
	
	@RequestMapping(value="/jobboard/storyaddok.action", method={RequestMethod.POST})
	public void member_storyaddok(HttpServletRequest request, HttpServletResponse response, HttpSession session, StoryBoardDTO dto) {
		
		
		dto.setMemberSeq((String)session.getAttribute("memberSeq"));
		
		int result = dao.storyadd(dto);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/jobboard/storylist.action");
			} else {
				response.sendRedirect("/living/jobboard/storyadd.action");
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
	}
	
	@RequestMapping(value="/jobboard/storydel.action", method={RequestMethod.GET})
	public String member_owner_storydel(HttpServletRequest request, HttpServletResponse response, HttpSession sesssion, String seq) {
		
		request.setAttribute("seq", seq);
		
		return "jobboard.storydel";
	}
	
	
	@RequestMapping(value="/jobboard/storydelok.action", method={RequestMethod.POST})
	public void member_owner_storydelok(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		int result = dao.storydel(seq);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/jobboard/storylist.action");
			} else {
				response.sendRedirect("/living/jobboard/storyview.action?seq=" + seq);
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	
	@RequestMapping(value="/jobboard/storyedit.action", method={RequestMethod.GET})
	public String member_owner_storyedit(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		StoryBoardDTO dto =  dao.storyget(seq);
		
		request.setAttribute("dto", dto);
		
		return "jobboard.storyedit";
	}
	
	
	@RequestMapping(value="/jobboard/storyeditok.action", method={RequestMethod.POST})
	public void member_owner_storyeditok(HttpServletRequest request, HttpServletResponse response, HttpSession session, StoryBoardDTO dto) {
		
		
		dto.setMemberSeq((String) session.getAttribute("memberSeq"));
		
		int result = dao.storyedit(dto);
		
		try {
			
			if (result == 1) {
				response.sendRedirect("/living/jobboard/storyview.action?seq=" + dto.getSeq());
			} else {
				response.sendRedirect("/living/jobboard/storyedit.action?seq=" + dto.getSeq());
			}
			
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	
}
