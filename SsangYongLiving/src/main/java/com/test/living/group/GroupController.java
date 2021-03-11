package com.test.living.group;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GroupController {

	@RequestMapping(value="/group/notice.action", method={RequestMethod.GET})
	public String notice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.notice";
	}
}
