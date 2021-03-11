package com.test.living;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/index.action", method = RequestMethod.GET)
	public String index(HttpServletRequest reqeust, HttpServletResponse response, HttpSession session) {
		
		
		return "index";
	}
	
}
