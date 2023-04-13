package com.seoullo.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoullo.cart.service.CartService;
import com.seoullo.cart.vo.CartVO;
import com.seoullo.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
public class CartController {
	
	private String module= "cart";
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService service;
	
	@RequestMapping("/list.do")
	public String list(Model model, HttpSession session) {
		log.info("장바구니리스트");
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String id = vo.getId();
		model.addAttribute("list", service.list(id));
		return module + "/list"; 
	}
	
	@PostMapping("/add.do")
	public String add(CartVO vo) {
		log.info("장바구니 담기 처리");
		log.info("vo"+vo);
		service.add(vo);
		return "redirect:list.do";
	}
	
	@PostMapping(value="/update.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> update(CartVO vo) {
		log.info("장바구니 수정처리");
		int result = service.update(vo);
		if(result == 1) {
			return new ResponseEntity<String>("1", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("2", HttpStatus.OK);
		}
	}
	
	@PostMapping(value="/delete.do", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<String> delete(@RequestParam(value = "nos[]") List<Long> nos) {
		log.info("장바구니 삭제처리");
		int result = service.delete(nos);
		if(result == nos.size()) {
			return new ResponseEntity<String>("1", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("2", HttpStatus.OK);
		}
	}

}
