package com.test.living.used;


import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UsedController {
   
   @Autowired
   private IProductDAO dao;
   
   //메인 페이지
   @RequestMapping(value="/used/main.action", method={RequestMethod.GET})
   public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.main";
   }

   
   
   //1. 상품 업로드
   @RequestMapping(value="/used/productUpload.action", method={RequestMethod.GET})
   public String productUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.productUpload";
   }
   
   //1. 상품 업로드 OK 
   @RequestMapping(value="/used/productUploadok.action", method={RequestMethod.POST})
   public void productUploadok(HttpServletRequest request, HttpServletResponse response, HttpSession session, ProductDTO dto) {
           
      
      dto.setSeq((String)session.getAttribute("seq"));
      
      int result = dao.productUpload(dto);
      
      try {
         if (result == 1) {
            response.sendRedirect("/living/used/main.action");
         } else {
            response.sendRedirect("/used/productUpload.action");
         }
      } catch(Exception e) {
         System.out.println(e);
      }
      
      
      
   }

   




   //2. 상품 수정 - 만들어야 함
   @RequestMapping(value="/used/edit.action", method={RequestMethod.GET})
   public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.edit";
   }
   
   //2. 상품 수정OK - 만들어야 함
   @RequestMapping(value="/used/editok.action", method={RequestMethod.POST})
   public String editok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.editok";
   }
   
   
   //3. 상품 삭제 - 만들어야 함
   @RequestMapping(value="/used/del.action", method={RequestMethod.GET})
   public String del(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.del";
   }
   
   //3. 상품 삭제OK - 만들어야 함
   @RequestMapping(value="/used/delok.action", method={RequestMethod.POST})
   public String delok(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.delok";
   }
   
   
   
   //4. 상품 View - 만들어야 함
   @RequestMapping(value="/used/productView.action", method={RequestMethod.GET})
   public String productView(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.productView";
   }

   
   //5. 상품 List
   @RequestMapping(value="/used/productList.action", method={RequestMethod.GET})
   public String productList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.productList";
   }   
   
   //5.메인 인기 상품 리스트 - 만들어야 함
   @RequestMapping(value="/used/popList.action", method={RequestMethod.GET})
   public String popList(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.popList";
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   @RequestMapping(value="/used/auth.action", method={RequestMethod.GET})
   public String auth(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      return "used.auth";
   }
   
   
   @RequestMapping(value="/used/login.action", method={RequestMethod.GET})
   public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq) {
      
      session.setAttribute("seq", seq); 
      
      
      try {
         response.sendRedirect("/living/used/main.action");
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   @RequestMapping(value="/used/logout.action", method={RequestMethod.GET})
   public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
      
      session.removeAttribute("seq"); //폐기 
      
      
      try {
         response.sendRedirect("/living/used/main.action");
      } catch (IOException e) {
         e.printStackTrace();
      }   
   }
   
   
   
   
   
}