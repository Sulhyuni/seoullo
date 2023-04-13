package com.seoullo.anonymous.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoullo.anonymous.service.AnonymousService;
import com.seoullo.anonymous.service.AnonymousServiceImpl;
import com.seoullo.anonymous.vo.AnonymousVO;
import com.seoullo.member.vo.MemberVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/anonymous")
@Log4j
public class AnonymousController {

	@Autowired
	@Qualifier("anonymousServiceImpl")
	private AnonymousService service;
	
	//리스트
	@RequestMapping("/list.do")
	public String list(@ModelAttribute("pageObject") PageObject pageObject,Model model) {
		log.info("anonymous list.................................");
		model.addAttribute("list",service.list(pageObject));
		return "anonymous/list";
	}
	
	//글보기  + 좋아요check
	@RequestMapping("/view.do")
	public String view(long anonyNo, long inc, Model model,HttpSession session,AnonymousVO vo) {
		log.info("anonymous view.................................");
		log.info("anonyNo = " +anonyNo + ", inc = "+inc);
		model.addAttribute("vo",service.view(anonyNo, inc));

			String id = ((MemberVO)session.getAttribute("login")).getId();
			vo.setId(id);
			//좋아요 check
			Boolean check = service.likeCheck(vo);
			model.addAttribute("check",check);
			  
		return "anonymous/view";
	}
	
	
	
//	//질문작성폼
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("anonymous writeForm.................................");
		return "anonymous/write";
	}
	//질문작성처리
	@PostMapping("/write.do")
	public String write(AnonymousVO vo, HttpSession session) {
		log.info("anonymous write.................................");
		//session에서 id 받아오기
		//개발 완료 후 주석 풀기
		String id=((MemberVO)session.getAttribute("login")).getId();
		vo.setId(id);
				
//		//개발중 id 하드코딩
//		vo.setId("test1");				
		service.write(vo);	//xml 처리(insert)	
		log.info(vo);
		return "redirect:list.do";
	}
	
	//수정
	@GetMapping("/update.do")
	public String updateForm(long anonyNo, Model model) {
		log.info("anonymous updateForm.................................");
		model.addAttribute("vo",service.view(anonyNo, 0));
		return "anonymous/update";
	}
	//수정처리
	@PostMapping("/update.do")
	public String update(AnonymousVO vo) {
		log.info("anonymous update.................................");
		service.update(vo);
		return "redirect:view.do?anonyNo="+vo.getAnonyNo()+"&inc=0";
	}
	
	//삭제 - 번호만 가져온다
	@GetMapping("/delete.do")
	public String delete(long anonyNo) {//no
		//DB처리
		service.delete(anonyNo);
		return "redirect:list.do";
	} 
	
	
// -----------------------------------------------------------------------------------
	//좋아요 등록
	@RequestMapping("/like.do")
	public String like(AnonymousVO vo ) {
		log.info("Like Insert.................................: "+vo);
		service.like(vo);
		return "redirect:view.do?anonyNo=" + vo.getAnonyNo() + "&inc=0";
		 
	}
	
	//좋아요 취소
	@RequestMapping	("/unlike.do")
	public String likeDelete(AnonymousVO vo ) {  
		log.info("Like Delete.................................: "+vo);
		service.unlike(vo);

		return "redirect:view.do?anonyNo=" + vo.getAnonyNo() + "&inc=0";
		
	}
}
