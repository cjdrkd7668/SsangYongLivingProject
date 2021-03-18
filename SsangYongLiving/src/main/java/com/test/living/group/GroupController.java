package com.test.living.group;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String member_notice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.notice";
	}
	
	//공동구매 특정 글 페이지 + Qna 글 리스트 페이지
	@RequestMapping(value="/group/view.action", method={RequestMethod.GET})
	public String view(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, int nowPage) {
		
		//String seq 공동구매 글 번호
		//String nowPage 현재 페이지
		
		//공동구매 글 정보 가져오기
		GroupBuyingPostDTO dto = groupBuyingPostDao.view(seq);
		
		QnaDTO qdto = new QnaDTO();
		qdto.setPostSeq(seq);
		qdto.setNowPage(nowPage);
		
		//Qna 글 목록 가져오기
		List<QnaDTO> qlist = qnaDao.list(qdto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("qlist", qlist);
		
		return "group.view";
	}
	
	//커뮤니티 글 리스트 페이지
	@RequestMapping(value="/group/community/list.action", method={RequestMethod.GET})
	public String communityList(HttpServletRequest request, HttpServletResponse response, HttpSession session, String postSeq, int nowPage) {
		
		//TODO 페이징 처리하기
		//회원 번호 가져오기
		session.setAttribute("seq", "1");
		
		CommunityDTO dto = new CommunityDTO();
		
		//현재 페이지 저장
		dto.setNowPage(nowPage);
		
		//커뮤니티 글 번호 저장
		dto.setPostSeq(postSeq);
		
		//커뮤니티 글 목록 가져오기
		List<CommunityDTO> list = communityDao.list(dto);
		
		request.setAttribute("list", list);
		
		return "group.communityList";
	}
	
	//커뮤니티 글 상세 보기 페이지
	@RequestMapping(value="/group/community/view.action", method={RequestMethod.GET})
	public String communityView(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
		
		//회원 번호 가져오기
		session.setAttribute("seq", "1");
		
		//글 정보 가져오기
		CommunityDTO dto = communityDao.view(seq);
		
		//회원 이름 가져오기
		String memberName = communityDao.memberName((String)session.getAttribute("seq"));
		
		//댓글 정보 가져오기
		List<CommunityCommentDTO> clist = communityCommentDao.view(seq);
		
		request.setAttribute("dto", dto);
		request.setAttribute("memberName", memberName);
		request.setAttribute("clist", clist);
		
		return "group.communityView";
	}
	
	//커뮤니티 글 작성 페이지
	@RequestMapping(value="/group/community/write.action", method={RequestMethod.GET})
	public String member_communityWrite(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.communityWrite";
	}
	
	//커뮤니티 일대일문의 페이지
	@RequestMapping(value="/group/community/chat.action", method={RequestMethod.GET})
	public String communityChat(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "group.communityChat";
	}	
	
}
