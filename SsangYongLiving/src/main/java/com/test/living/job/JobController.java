package com.test.living.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JobController {

	@RequestMapping(value="/job/index.action", method={RequestMethod.GET})
	public String index(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "job.index";
	}
	
	
	
	@RequestMapping(value="/job/recruitmentList.action", method={RequestMethod.GET})
	public String recruitmentList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	
		
		return "job.recruitmentList";
			
	}
	
	
	@RequestMapping(value="/job/recruitmentView.action", method={RequestMethod.GET})
	public String recruitmentView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "job.recruitmentView";
	}
	
	
	@RequestMapping(value="/jobboard/storylist.action", method={RequestMethod.GET})
	public String storylist(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "jobboard.storylist";
	}
	
	
}
