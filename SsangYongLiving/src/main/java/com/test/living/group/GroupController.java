package com.test.living.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupController {

	//알림 페이지
	@RequestMapping(value="/group/notice.action", method={RequestMethod.GET})
	public String member_notice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.notice";
	}
	
	//공동구매글 상세 보기 페이지 + Qna 글 리스트 페이지
	@RequestMapping(value="/group/view.action", method={RequestMethod.GET})
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.view";
	}
	
	//커뮤니티 글 리스트 페이지
	@RequestMapping(value="/group/community/list.action", method={RequestMethod.GET})
	public String community_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.community_list";
	}
	
	//커뮤니티 글 작성 페이지
	@RequestMapping(value="/group/community/write.action", method={RequestMethod.GET})
	public String member_community_write(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.community_write";
	}
	
	//커뮤니티 글 상세 보기 페이지
	@RequestMapping(value="/group/community/view.action", method={RequestMethod.GET})
	public String community_view(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.community_view";
	}
	
}
