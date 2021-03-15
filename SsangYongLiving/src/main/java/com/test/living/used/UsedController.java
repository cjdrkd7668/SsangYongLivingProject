package com.test.living.used;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsedController {
	
	@RequestMapping(value="/used/main.action", method={RequestMethod.GET})
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "used.main";
	}
}