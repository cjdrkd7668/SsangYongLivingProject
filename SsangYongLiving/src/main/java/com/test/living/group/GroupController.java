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
	public String notice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.notice";
	}
	
	//커뮤니티 페이지
	@RequestMapping(value="/group/community.action", method={RequestMethod.GET})
	public String community(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.community";
	}
}
