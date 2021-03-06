package com.test.living.group;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * GroupController. 공동구매 비즈니스 로직을 수행하는 컨트롤러
 * @author 이찬미
 *
 */
@Controller
public class GroupController {
	
	@Autowired
	private ICommunityDAO communityDao;
	
	@Autowired
	private ICommunityCommentDAO communityCommentDao;
	
	@Autowired
	private IGroupBuyingPostDAO groupBuyingPostDao;
	
	@Autowired
	private IQnaDAO qnaDao;
	
	@Autowired
	private ICouponDAO couponDao;
	
	@Autowired
	private INoticeDAO noticeDao;
	
	@RequestMapping(value="/inc/groupheader.action", method={RequestMethod.GET})
	public String member_groupHeader(HttpServletRequest request, HttpServletResponse response, HttpSession session, String memberSeq) {
		
		//memberSeq 회원 번호
		//회원 이름 가져오기
		String memberName = communityDao.memberName(memberSeq);
		
		//읽지 않은 알림 개수 가져오기
		int postCount = noticeDao.notReadCount(memberSeq);
		int couponCount = couponDao.notReadCount(memberSeq);
		int count = postCount + couponCount;
		
		request.setAttribute("memberName", memberName);
		request.setAttribute("count", count);
		
		return "inc.groupheader";
	}
	
	//알림 페이지
	@RequestMapping(value="/group/notice.action", method={RequestMethod.GET})
	public String member_notice(HttpServletRequest request, HttpServletResponse response, HttpSession session, String memberSeq) {
		
		//memberSeq 회원 번호
		//회원 이름 가져오기
		String memberName = communityDao.memberName(memberSeq);
		
		//읽지 않은 알림 개수 가져오기
		int postCount = noticeDao.notReadCount(memberSeq);
		int couponCount = couponDao.notReadCount(memberSeq);
		int count = postCount + couponCount;
		
		//공구 알림 정보 가져오기
		List<NoticeDTO> nlist = noticeDao.list(memberSeq);
		
		//쿠폰 알림 정보 가져오기
		List<CouponDTO> clist = couponDao.list(memberSeq);
		
		request.setAttribute("memberName", memberName);
		request.setAttribute("count", count);
		request.setAttribute("nlist", nlist);
		request.setAttribute("clist", clist);
		
		return "group.notice";
	}
	
	//공동구매 특정 글 페이지 + Qna 글 리스트 페이지
	@RequestMapping(value="/group/view.action", method={RequestMethod.GET})
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, int nowPage) {
		
		//String seq 공동구매 글 번호
		//String nowPage 현재 페이지
		
		//공동구매 글 정보 가져오기
		GroupBuyingPostDTO dto = groupBuyingPostDao.view(seq);
		
		//Qna 글 목록 가져오기 -> 프로시저 호출
		QnaDTO qdto = new QnaDTO();
		qdto.setPostSeq(seq);
		qdto.setNowPage(nowPage);
		
		List<QnaDTO> qlist = qnaDao.list(qdto);
		
		request.setAttribute("qlist", qlist);
		
		//총 페이지 수 가져오기
		int totalPage = qnaDao.communityTotalPage(seq);
		
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("totalPage", totalPage);
		
		request.setAttribute("dto", dto);
		
		return "group.view";
	}
	
	//Qna 글 작성 페이지 호출
	@RequestMapping(value="/group/add.action", method={RequestMethod.GET})
	public String member_add(HttpServletRequest request, HttpServletResponse response, HttpSession session, QnaDTO dto) {
		
		request.setAttribute("dto", dto);
		
		return "group.add";
	}
	
	//Qna 네이버 쇼핑 페이지 호출
	@RequestMapping(value="/group/search.action", method={RequestMethod.GET})
	public String member_search(HttpServletRequest request, HttpServletResponse response, HttpSession session, String query) {
		
		Object total = 0;
		
		request.setAttribute("query", query);
		
		ArrayList<SearchDTO> slist = new ArrayList<SearchDTO>();
		
		if (query != null && query != "") {
			//검색O
			
			String clientId = "qTs3BPX3uk9EWgRZcdEV"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "meQwjGIZpP"; //애플리케이션 클라이언트 시크릿값"


	        String text = null;
	        
	        try {
	            text = URLEncoder.encode(query, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }


	        String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text + "&display=5";    


	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        
	        //responseBody
	        // - 검색 결과
	        // - String -> parse -> Java에서 인식한 형태로 변환
	        // - JSON Parser -> *.jar
	        
	        try {
	        
		        JSONParser parser = new JSONParser();
		        
		        //해석(구문분석)
		        JSONObject json = (JSONObject)parser.parse(responseBody);

		        System.out.println(json.get("total"));
		        System.out.println(json.get("display"));
		        total = json.get("total");
		        
		        //쇼핑 목록들(items)
		        JSONArray list = (JSONArray)json.get("items");

		        
		        for (int i=0; i<list.size(); i++) {
		        	
		        	SearchDTO dto = new SearchDTO();
		        	
		        	JSONObject search = (JSONObject)list.get(i);
		        	
		        	String title = (String)search.get("title");
		        	String image = (String)search.get("image");
		        	String link = (String)search.get("link");
		        	String lprice = (String)search.get("lprice");
		        	String category4 = (String)search.get("category4");
		        	String mallName = (String)search.get("mallName");
		        	
		        	dto.setTitle(title);
		        	dto.setImage(image);
		        	dto.setLink(link);
		        	dto.setLprice(lprice);
		        	dto.setCategory4(category4);
		        	dto.setMallName(mallName);

		        	slist.add(dto);
		        }
	        
	        } catch(Exception e) {
	        	System.out.println(e);
	        }
	   	}		
		
		request.setAttribute("slist", slist);
		
		request.setAttribute("total", total);
		
		return "group.search";
	}

	private String get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	            con.setRequestProperty(header.getKey(), header.getValue());
	        }
	
	
	        int responseCode = con.getResponseCode();
	        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	            return readBody(con.getInputStream());
	        } else { // 에러 발생
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API 요청과 응답 실패", e);
	    } finally {
	        con.disconnect();
	    }
	}
	
	
	private HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	    }
	}
	
	
	private String readBody(InputStream body){
	    InputStreamReader streamReader = new InputStreamReader(body);
	
	
	    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	        StringBuilder responseBody = new StringBuilder();
	
	
	        String line;
	        while ((line = lineReader.readLine()) != null) {
	            responseBody.append(line);
	        }
	
	
	        return responseBody.toString();
	    } catch (IOException e) {
	        throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	    }
	}
	
	//Qna 글 작성 처리
	@RequestMapping(value="/group/addok.action", method={RequestMethod.POST})
	public void member_addok(HttpServletRequest request, HttpServletResponse response, HttpSession session, QnaDTO dto) {
		
		//첨부 파일 처리
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		
		MultipartFile fileName = multi.getFile("fileName");
		System.out.println(fileName.getName());
		
		String saveName = "";
		
		//파일 저장 경로와 중복 파일명 처리
		try {
			
			String path = request.getRealPath("resources/files");
			
			System.out.println(path);
			
			saveName = getFileName(path, fileName.getOriginalFilename());
			
			dto.setFileName(saveName);
			
			//첨부 파일 최종 경로
			File file = new File(path + "\\" + saveName);
			
			fileName.transferTo(file);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		dto.setMemberSeq("1");
		int thread = qnaDao.getThread();
		dto.setThread(thread);
		dto.setDepth(0);
		
		
		int result = qnaDao.add(dto);
		
		try {
			
			if (result == 1) {
				response.sendRedirect("/living/group/view.action?seq="+dto.getPostSeq()+"&nowPage="+dto.getNowPage());
			} else {
				response.sendRedirect("/living/group/view.action?seq="+dto.getPostSeq()+"&nowPage="+dto.getNowPage());
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	//파일명 반환 메소드
	private String getFileName(String path, String filename) {
		
		//인덱스 숫자
		int number = 1;
		int index = filename.indexOf(".");
		
		//. 앞까지 이름을 저장
		String tempName = filename.substring(0, index);
		
		//. 이후 확장자 저장
		String tempExt = filename.substring(index);
		
		while (true) {
			
			File file = new File(path + "\\" +filename);
			
			//파일명 중복일 경우
			if (file.exists()) {
				//수정 -> xxx(1).xxx
				filename = tempName + "(" + number + ")" + tempExt;
				number++;
			} else {
				return filename;
			}
		}
	}

	//커뮤니티 글 리스트 페이지
	@RequestMapping(value="/group/community/list.action", method={RequestMethod.GET})
	public String communityList(HttpServletRequest request, HttpServletResponse response, HttpSession session, String postSeq, int nowPage) {
		
		//회원 번호 가져오기
		//session.setAttribute("seq", "1");
		
		//조회수 증가 플래그
		session.setAttribute("groupCommunityRead", false);
		
		CommunityDTO dto = new CommunityDTO();
		
		//현재 페이지 저장
		dto.setNowPage(nowPage);
		
		//커뮤니티 글 번호 저장
		dto.setPostSeq(postSeq);

		//커뮤니티 글 목록 가져오기
		List<CommunityDTO> list = communityDao.list(dto);
		
		//많이 본 글 목록 가져오기
		List<CommunityDTO> mostViewList = communityDao.mostViewList(postSeq);
		
		//많이 본 글 제목 길이 수정
		for (CommunityDTO mvdto : mostViewList) {
			if (mvdto.getSubject().length() > 15) {
				mvdto.setSubject(mvdto.getSubject().substring(0, 15) + "...");
			}
		}
		
		//추천 글 목록 가져오기
		List<CommunityDTO> recList = communityDao.recList(postSeq);
		
		//제목 길이 수정
		for (CommunityDTO rdto : recList) {
			if (rdto.getSubject().length() > 15) {
				rdto.setSubject(rdto.getSubject().substring(0, 15) + "...");
			}
		}
		
		//댓글 많은 글 목록 가져오기
		List<CommunityDTO> mostCmtList = communityDao.mostCmtList(postSeq);
		
		//제목 길이 수정
		for (CommunityDTO mcdto : mostCmtList) {
			if (mcdto.getSubject().length() > 15) {
				mcdto.setSubject(mcdto.getSubject().substring(0, 15) + "...");
			}
		}
		
		//공동구매 글 정보 가져오기
		GroupBuyingPostDTO pdto = groupBuyingPostDao.view(postSeq);
		
		//총 페이지 수 가져오기
		int totalPage = communityDao.communityTotalPage(postSeq);

		request.setAttribute("nowPage", nowPage);
		request.setAttribute("totalPage", totalPage);
		
		request.setAttribute("list", list);
		request.setAttribute("mostViewList", mostViewList);
		request.setAttribute("recList", recList);
		request.setAttribute("mostCmtList", mostCmtList);
		
		request.setAttribute("pdto", pdto);
		
		return "group.communityList";
	}
	
	//커뮤니티 글 상세 보기 페이지
	@RequestMapping(value="/group/community/view.action", method={RequestMethod.GET})
	public String communityView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, String memberSeq, String nowPage) {
		
		if ((boolean)session.getAttribute("groupCommunityRead") == false) {
			//조회수 증가하기
			communityDao.updateCommunityReadcount(seq);
			session.setAttribute("groupCommunityRead", true);
		}
		
		//글 정보 가져오기
		CommunityDTO dto = communityDao.view(seq);
		
		//회원 이름 가져오기
		String memberName = communityDao.memberName(memberSeq);
		
		//댓글 정보 가져오기
		List<CommunityCommentDTO> clist = communityCommentDao.view(seq);
		
		//돌아가기 시 돌아갈 페이지 번호
		request.setAttribute("nowPage", nowPage);
		
		request.setAttribute("dto", dto);
		request.setAttribute("memberName", memberName);
		request.setAttribute("clist", clist);
		
		return "group.communityView";
	}
	
	//추천 수 증가
	@RequestMapping(value="/group/community/updatecommunityreccount.action", method= {RequestMethod.GET})
	public void member_updateCommunityReccount(HttpServletRequest request, HttpServletResponse response, String seq) {
	
		communityDao.updateCommunityReccount(seq);
	}
	
	
	//커뮤니티 글 작성 페이지 호출
	@RequestMapping(value="/group/community/add.action", method={RequestMethod.GET})
	public String member_communityAdd(HttpServletRequest request, HttpServletResponse response, HttpSession session, String postSeq, String memberSeq, String nowPage) {
		
		//공동구매 글 정보 가져오기
		GroupBuyingPostDTO pdto = groupBuyingPostDao.view(postSeq);

		request.setAttribute("postSeq", postSeq);
		request.setAttribute("memberSeq", memberSeq);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("pdto", pdto);
		
		return "group.communityAdd";
	}
	
	//커뮤니티 글 작성(insert) 처리
	@RequestMapping(value="/group/community/addok.action", method={RequestMethod.POST})
	public void member_communityAddOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityDTO dto) {
		
		int nowPage = dto.getNowPage();
		
		int result = communityDao.add(dto);
		
		try {
			
			if (result == 1) {
				response.sendRedirect("/living/group/community/list.action?postSeq="+dto.getPostSeq()+"&nowPage="+nowPage);
				
			} else {
				response.sendRedirect("/living/group/community/add.acion?postSeq="+dto.getPostSeq()+"&memberSeq="+dto.getMemberSeq()+"&nowPage="+nowPage);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//커뮤니티 글 수정 페이지 호출
	@RequestMapping(value="/group/community/edit.action", method={RequestMethod.GET})
	public String member_communityEdit(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityDTO dto) {
		
		//공동구매 글 정보 가져오기
		GroupBuyingPostDTO pdto = groupBuyingPostDao.view(dto.getPostSeq());
		
		//글 정보 가져오기
		CommunityDTO cdto = communityDao.view(dto.getSeq());
		
		request.setAttribute("postSeq", dto.getPostSeq());
		request.setAttribute("nowPage", dto.getNowPage());
		request.setAttribute("pdto", pdto);
		request.setAttribute("cdto", cdto);
		
		return "group.communityEdit";
	}
	
	//커뮤니티 글 수정 처리
	@RequestMapping(value="/group/community/editok.action", method={RequestMethod.POST})
	public void member_communityEditOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityDTO dto) {
		
		int nowPage = dto.getNowPage();
		
		int result = communityDao.edit(dto);
		
		try {
			
			if (result == 1) {
				//성공 시 해당 글로 이동
				response.sendRedirect("/living/group/community/view.action?seq="+dto.getSeq()+"&memberSeq="+(String)(session.getAttribute("seq")) +"&nowPage="+nowPage);
				
			} else {
				//실패 시 수정 페이지로 이동
				response.sendRedirect("/living/group/community/edit.acion?postSeq="+dto.getPostSeq()+"&seq="+dto.getSeq()+"&nowPage="+nowPage);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//커뮤니티 글 삭제
	@RequestMapping(value="/group/community/del.action", method={RequestMethod.GET})
	public void member_communityDel(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityDTO dto) {
		
		int result = communityDao.del(dto.getSeq());
		
		try {
			
			if (result == 1) {
				//성공 시 커뮤니티 목록으로 이동
				response.sendRedirect("/living/group/community/list.action?postSeq="+dto.getPostSeq()+"&nowPage="+dto.getNowPage());
				
			} else {
				//실패 시 해당 게시글로 이동
				response.sendRedirect("/living/group/community/view.action?seq="+dto.getSeq()+"&memberSeq="+(String)(session.getAttribute("seq")) +"&nowPage="+dto.getNowPage());
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//커뮤니티 댓글 작성(insert) 처리
	@RequestMapping(value="/group/community/commentaddok.action", method={RequestMethod.POST})
	public void member_communityCommentAddOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityCommentDTO dto) {
		
		dto.setMemberSeq((String)session.getAttribute("seq"));
		
		//DAO 위임해 insert
		int result = communityCommentDao.add(dto);
		
		try {
			
			if (result == 1) {
				response.sendRedirect("/living/group/community/view.action?seq=" + dto.getCommunitySeq() + "&memberSeq=" + dto.getMemberSeq() +"&nowPage=" + dto.getNowPage());
				
			} else {
				
				PrintWriter writer = response.getWriter();
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");

				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	//커뮤니티 댓글 수정(update) 처리
	@RequestMapping(value="/group/community/commenteditok.action", method={RequestMethod.GET})
	public void member_communityCommentEditOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityCommentDTO dto) {
		
		dto.setMemberSeq("1");
		
		int result = communityCommentDao.edit(dto);
		
		try {
			
			if (result == 1) {
				System.out.println("댓글 수정이 되었습니다.");
				
			} else {
				
				PrintWriter writer = response.getWriter();
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");

				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	//커뮤니티 댓글 삭제(update) 처리
	@RequestMapping(value="/group/community/commentdelok.action", method={RequestMethod.GET})
	public void member_communityCommentDelOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityCommentDTO dto) {
		
		dto.setMemberSeq("1");
		
		int result = communityCommentDao.del(dto);
		
		try {
			
			if (result == 1) {
				System.out.println("댓글이 삭제 되었습니다.");
				
			} else {
				
				PrintWriter writer = response.getWriter();
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");

				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	//커뮤니티 대댓글 작성(insert) 처리
	@RequestMapping(value="/group/community/replyaddok.action", method={RequestMethod.GET})
	public void member_communityReplyAddOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, CommunityCommentDTO dto) {
		//"memberSeq" + memberSeq + "communitySeq=" + replyCommunitySeq + "&pseq=" + replySeq,
		
		dto.setMemberSeq("1");
		
		//DAO 위임해 insert
		int result = communityCommentDao.replyAdd(dto);
		
		try {
			
			if (result == 1) {
				System.out.println("대댓글 작성이 되었습니다.");
				
			} else {
				
				PrintWriter writer = response.getWriter();
				
				writer.print("<html><body>");
				writer.print("<script>");
				writer.print("alert('failed');");
				writer.print("history.back();");
				writer.print("</script>");
				writer.print("</body></html>");

				writer.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	//커뮤니티 일대일문의 페이지
	@RequestMapping(value="/group/community/echo.action", method={RequestMethod.GET})
	public String communityChat(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.websocket-echo";
	}	
	
}
