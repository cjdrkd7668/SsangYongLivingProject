package com.test.living.recipe;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.living.inc.Pagination;


@Controller
public class RecipeController {
	
	@Autowired
	private IRecipeDAO rdao;
	
	@Autowired
	private IRecipeStockDAO rsdao;
	
	@Autowired
	private IRecipeOrderDAO rodao;
	
	@Autowired
	private IRecipeCommentDAO rcdao;
	
	@Autowired
	private IingredientDAO igdao;
	
	@RequestMapping(value="/recipe/main.action", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.main";
	}
	
	@RequestMapping(value="/recipe/renewRefri.action", method=RequestMethod.GET)
	public String member_renewRefri(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.renewRefri";
	}
	
	@RequestMapping(value="/recipe/board.action", method=RequestMethod.GET)
	public String boardRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session, String page) {
		
		//현재 페이지 수 구하기
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 6;		//한페이지 당 출력 개수
		int blockSize = 5;		//페이지바 사이즈

		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}

		//페이지 당 첫 글과 마지막 글에 대한 인덱스 구하기
		int begin = 0;			//rnum 시작
		int end = 0;			//rnum 끝
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin);
		map.put("end", end);
		
		List<RecipeDTO> list = rdao.getRecipeList(map);
		
		totalCount = rdao.getRecipeTotalCount();
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/living/recipe/board.action");
		
		request.setAttribute("list", list);
		request.setAttribute("page", nowPage);
		request.setAttribute("pageBar", pageBar);
		
		return "recipe.board";
	}
	
	@RequestMapping(value="/recipe/detail.action", method=RequestMethod.GET)
	public String boardDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, String page) {
		
		RecipeDTO rdto = rdao.getRecipeDto(seq);
		List<RecipeStockDTO> rsList = rsdao.getRecipeStockList(seq);
		List<RecipeOrderDTO> roList = rodao.getRecipeOrderList(seq);
		List<RecipeCommentDTO> rcList = rcdao.getRecipeCommentList(seq);
		
		request.setAttribute("rdto", rdto);
		request.setAttribute("rsList", rsList);
		request.setAttribute("roList", roList);
		request.setAttribute("rcList", rcList);
		request.setAttribute("page", page);
		
		return "recipe.detail";
	}
	
	@RequestMapping(value="/recipe/delComment.action", method=RequestMethod.GET)
	public void delComment(HttpServletRequest request, HttpServletResponse response, HttpSession session, String commentSeq, String recipeSeq, String page) {
		
		int result = rcdao.delComment(commentSeq);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);				
			} else {				
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	@RequestMapping(value="/recipe/addComment.action", method=RequestMethod.POST)
	public void addComment(HttpServletRequest request, HttpServletResponse response, HttpSession session, RecipeCommentDTO rcdto, String page) {
		
		rcdto.setMemberSeq((String)session.getAttribute("seq"));
		String recipeSeq = rcdto.getRecipeSeq();
		int result = rcdao.addRecipeComment(rcdto);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);
			} else {
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	@RequestMapping(value="/recipe/delRecipe.action", method=RequestMethod.GET)
	public void delRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, String page) {
		
		int result = rdao.delRecipe(seq);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/recipe/board.action");				
			} else {				
				response.sendRedirect("/living/recipe/detail.action?seq=" + seq + "&page=" + page);				
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		
	}
	
	@RequestMapping(value="/recipe/addRecipe.action", method=RequestMethod.GET)
	public String addRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		List<IngredientDTO> igList = igdao.getIngredientList();
		
		request.setAttribute("igList", igList);
		
		return "recipe.addRecipe";
	}
	
	@RequestMapping(value="/recipe/addRecipeOk.action", method=RequestMethod.POST)
	public void addRecipeOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, RecipeDTO dto, String[] ingredientSeq, String[] recipeStockNum, String[] recipeOrderSubject) {
		
		dto.setMemberSeq((String)session.getAttribute("seq"));
		
		//첨부 파일 처리하기
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		
		try {
			
			MultipartFile attach = multi.getFile("attach");
			String filename = getFileName(request, attach);
			
			dto.setRecipeImage(filename);
			
			int result = rdao.addRecipe(dto);
			
			if (result == 1) {
				
				RecipeStockDTO rsdto = new RecipeStockDTO();
				
				for (int i=0; i<ingredientSeq.length; i++) {
					rsdto.setIngredientSeq(ingredientSeq[i]);
					rsdto.setRecipeStockNum(recipeStockNum[i]);
					
					result *= rsdao.addRecipeStock(rsdto);
				}
				
				RecipeOrderDTO rodto = new RecipeOrderDTO();
				
				for (int i=0; i<recipeOrderSubject.length; i++) {
					attach = multi.getFiles("recipeOrderImage").get(i);
					
					rodto.setRecipeOrderImage(getFileName(request, attach));
					rodto.setRecipeOrderContent(recipeOrderSubject[i]);
					
					result *= rodao.addRecipeOrder(rodto);
					
				}
				
				
				if (result == 1) {
					response.sendRedirect("/living/recipe/board.action");				
					
				} 
				System.out.println("#################################################################");
			}		
			response.sendRedirect("/living/recipe/addRecipe.action");				
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private String getFileName(HttpServletRequest request, MultipartFile attach) throws IOException {
		String filename = "";
		String path = request.getRealPath("/resources/images");
		filename = getFileName(path, attach.getOriginalFilename());
		File file = new File(path + "\\" + filename);
		attach.transferTo(file);
		return filename;
	}
	
	private String getFileName(String path, String filename) {
		
		int n = 1;
		int index = filename.indexOf(".");
		String tempName = filename.substring(0, index);
		String tempExt = filename.substring(index);
		
		//무한루프로 시퀀스 느낌내기 
		while (true) {
			
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				//있다 -> 중복 -> 파일명 수정
				filename = tempName + "_" + n + tempExt;
				n++;
			} else {
				//없다 -> 반환
				return filename;
			}
			
		}
		
	}
	
	@RequestMapping(value="/recipe/editRecipe.action", method=RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.editRecipe";
	}
	
	
	
}
