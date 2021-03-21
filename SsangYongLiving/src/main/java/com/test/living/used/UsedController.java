package com.test.living.used;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.living.inc.Pagination;

@Controller
public class UsedController {

	@Autowired
	private IProductDAO dao;

	// 메인 페이지
	@RequestMapping(value = "/used/main.action", method = { RequestMethod.GET })
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		List<ProductDTO> poplist = dao.poplist();

		request.setAttribute("poplist", poplist);

		return "used.main";
	}

	// 1. 상품 업로드
	@RequestMapping(value = "/used/productUpload.action", method = { RequestMethod.GET })
	public String productUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.productUpload";
	}

	// 1. 상품 업로드 OK
	@RequestMapping(value = "/used/productUploadok.action", method = { RequestMethod.POST })
	public void productUploadok(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ProductDTO dto) {

		dto.setSeq((String) session.getAttribute("seq"));

		int result = dao.productUpload(dto);

		try {
			if (result == 1) {
				response.sendRedirect("/living/used/main.action");
			} else {
				response.sendRedirect("/used/productUpload.action");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	// 2. 상품 수정 - X
	@RequestMapping(value = "/used/edit.action", method = { RequestMethod.GET })
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.edit";
	}

	// 2. 상품 수정OK - X
	@RequestMapping(value = "/used/editok.action", method = { RequestMethod.POST })
	public String editok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.editok";
	}

	// 3. 상품 삭제 - X
	@RequestMapping(value = "/used/del.action", method = { RequestMethod.GET })
	public String del(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.del";
	}

	// 3. 상품 삭제OK - X
	@RequestMapping(value = "/used/delok.action", method = { RequestMethod.POST })
	public String delok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.delok";
	}

	// 4. 상품 View 
	@RequestMapping(value = "/used/productView.action", method = { RequestMethod.GET })
	public String productView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		ProductDTO view = dao.get(seq);
		//List<ProductDTO> view = dao.view(seq);
		
		request.setAttribute("view", view);
		
		return "used.productView";
	}

	// 5. 상품 List
	@RequestMapping(value = "/used/productList.action", method = { RequestMethod.GET })
	public String productList(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			String page) {

		// 페이징
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 12; // 한페이지 당 출력 개수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // rnum 시작 번호
		int end = 0; // rnum 끝 번호
		int n = 0; // 페이지바 관련 변수
		int loop = 0; // 페이지바 관련 변수
		int blockSize = 5; // 페이지바 관련 변수

		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin);
		map.put("end", end);

		List<ProductDTO> list = dao.list(map);

		totalCount = dao.getProductTotalCount();

		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize,
				"/living/used/productList.action");

		request.setAttribute("list", list);
		request.setAttribute("page", nowPage);
		request.setAttribute("pageBar", pageBar);

		return "used.productList";
	}


	@RequestMapping(value = "/used/auth.action", method = { RequestMethod.GET })
	public String auth(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "used.auth";
	}

	@RequestMapping(value = "/used/login.action", method = { RequestMethod.GET })
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {

		session.setAttribute("seq", seq);

		try {
			response.sendRedirect("/living/used/main.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//X
	@RequestMapping(value = "/used/logout.action", method = { RequestMethod.GET })
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		session.removeAttribute("seq"); // 폐기

		try {
			response.sendRedirect("/living/used/main.action");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}