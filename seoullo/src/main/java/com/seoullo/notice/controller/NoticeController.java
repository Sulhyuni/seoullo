package com.seoullo.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoullo.notice.service.NoticeService;
import com.seoullo.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService service;
	
	
	@RequestMapping("/list.do")
	public String list(PageObject pageObject,Model model){
		log.info("공지사항 리스트---------------------");
		model.addAttribute("list", service.list(pageObject));
		return "notice/list";
	}
	@RequestMapping("/view.do")
	public String view(Model model,long no, int inc){
		log.info("공지사항  글보기--------------------");
		NoticeVO vo = service.view(no, inc);
		model.addAttribute("vo", service.view(no, inc));
		return "notice/view";
	}
	@GetMapping("/write.do")
	public String writeForm(){
		log.info("공지사항 글등록--------------------");
		return "notice/write";
	}
	
	
	@PostMapping("/write.do")
	public String write(NoticeVO vo,RedirectAttributes rttr){
		log.info("공지사항 글등록처리--------------------");
		service.write(vo);
		rttr.addFlashAttribute("m", "공지사항이 등록되었습니다.");
		return "redirect:list.do";
	}
	@GetMapping("/update.do")
	public String updateForm(Model model,long no){
		log.info("공지사항 글 수정 폼--------------------");
		model.addAttribute("vo", service.view(no, 0));
		return "notice/update";
	}
	@PostMapping("/update.do")
	public String update(NoticeVO vo,RedirectAttributes rttr){
		log.info("공지사항 글 수정 처리-------------------- ");
		service.update(vo);
		rttr.addFlashAttribute("m", "공지사항이 수정되었습니다.");
		return "redirect:view.do?no="+vo.getNo()+"&inc=0";
	}
	@GetMapping("/delete.do")
	public String delete(long no,RedirectAttributes rttr){
		log.info("공지사항 글 삭제 처리-------------------- ");
		service.delete(no);
		rttr.addFlashAttribute("m", "공지사항이 삭제되었습니다.");
		return "redirect:list.do";
	}
	
	
}
