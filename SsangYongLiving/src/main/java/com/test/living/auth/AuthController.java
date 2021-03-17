package com.test.living.auth;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AuthController {

	@RequestMapping(value = "/auth/login.action", method = RequestMethod.GET)
	public String login(HttpServletRequest reqeust, HttpServletResponse response, HttpSession session) {
		
		return "auth.login";
	}
	
	@RequestMapping(value = "/auth/auth.action", method = RequestMethod.GET)
	public void auth(HttpServletRequest reqeust, HttpServletResponse response, HttpSession session, String seq, String id, String access) {
		
		session.setAttribute("seq", seq);
		session.setAttribute("id", id);
		session.setAttribute("access", access);
		
		try {
			System.out.println("##로그인성공##");
			System.out.println(session.getAttribute("seq"));
			System.out.println(session.getAttribute("id"));
			System.out.println(session.getAttribute("access"));
			System.out.println("##로그인성공##");
			response.sendRedirect("/living/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/auth/logout.action", method={RequestMethod.GET})
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		session.removeAttribute("seq");
		session.removeAttribute("id");
		session.removeAttribute("access");
		
		//2.
		try {
			System.out.println("##로그아웃성공##");
			System.out.println(session.getAttribute("seq"));
			System.out.println(session.getAttribute("id"));
			System.out.println(session.getAttribute("access"));
			System.out.println("##로그아웃성공##");
			response.sendRedirect("/living/index.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
