package com.test.living.group;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//알림 페이지
	@RequestMapping(value="/group/notice.action", method={RequestMethod.GET})
	public String member_notice(HttpServletRequest request, HttpServletResponse response, HttpSession session, String memberSeq) {
		
		//memberSeq 회원 번호
		
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
