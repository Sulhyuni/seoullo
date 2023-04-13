package com.seoullo.book.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoullo.book.service.BookService;
import com.seoullo.book.vo.BookDetailVO;
import com.seoullo.book.vo.BookVO;
import com.seoullo.cart.service.CartService;
import com.seoullo.cart.vo.CartVO;
import com.seoullo.member.service.MemberService;
import com.seoullo.member.vo.MemberVO;
import com.seoullo.tour.service.TourService;
import com.webjjang.util.PageObject;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book")
@Log4j
public class BookController {
	
	private String module = "book";
	
	@Autowired
	@Qualifier("bookServiceImpl")
	private BookService service;
	
	@Autowired
	@Qualifier("tourServiceImpl")
	private TourService tourService;
	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute("pageObject")PageObject pageObject
						, Model model, HttpSession session, Long tourNo) {
		log.info("예약리스트");
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		int gradeNo = loginVO .getGradeNo();
		pageObject.setPerPageNum(5);
		if(gradeNo == 2 || gradeNo == 3) { // 가이드의 예약 리스트
			model.addAttribute("tourvo", tourService.view(tourNo, 0));
			model.addAttribute("list", service.guideList(tourNo));
			return module + "/guideList";
		} else if (gradeNo == 1){ // 일반회원의 예약 리스트
			String id = loginVO.getId();
			model.addAttribute("list", service.perList(pageObject, id));		
			return module + "/list";
		} else { // 관리자의 예약 리스트
			model.addAttribute("list", service.list(pageObject));		
			return module + "/list";
		}
	}
	
	@RequestMapping("/view.do")
	public String view(long no, Model model) {
		log.info("예약 상세보기");
		model.addAttribute("view", service.view(no));
		return module + "/view";
	}
	
	@PostMapping("/cancel.do")
	public String cancel(BookDetailVO vo) {
		log.info("예약 취소");
		service.cancel(vo);
		return "redirect:list.do";
	}
	
	@GetMapping("/book.do")
	public String bookForm(String cartNos, Long no, Model model, HttpSession session) {
		log.info("예약하기 폼");
		if(no != null ) { // 투어번호 들어왔을 때			
			model.addAttribute("vo", tourService.view(no, 0));
		} else if (cartNos != null){ // 장바구니 번호 들어왔을 때			
			List<Long> list = Arrays.stream(cartNos.split(",")).map(Long::parseLong).collect(Collectors.toList());
			model.addAttribute("list", cartService.orderList(list));
		}
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String id = vo.getId();
		model.addAttribute("member", memberService.view(id));
		return module + "/book";
	}
	
	@PostMapping("/book.do")
	public String book(BookVO vo, BookDetailVO dvo, Long[] cartNos) throws Exception {
		log.info("예약하기 처리");
		List<BookDetailVO> bookDetailList = new ArrayList<BookDetailVO>();
		// 장바구니에서 여러개 예약할 떄
		if(cartNos != null) {			
			// 장바구니 번호 가져와서 List로 바꾸기
			List<Long> cartNoList = Arrays.asList(cartNos);
			// 장바구니 리스트 여러개 가져오기
			List<CartVO> cartList = cartService.orderList(cartNoList);
			for(CartVO cartvo : cartList) {
				BookDetailVO detailvo = new BookDetailVO();
				detailvo.setTourNo(cartvo.getTourNo());
				detailvo.setPeopleA(cartvo.getPeopleA());
				detailvo.setPeopleB(cartvo.getPeopleB());
				detailvo.setTourPrice(cartvo.getTourPrice());
				detailvo.setDay(cartvo.getDay());
				if(vo.getPayMethod().equals("신용카드")) {
					detailvo.setBookStatus("예약완료");
				} else {
					detailvo.setBookStatus("예약대기");
				}
				bookDetailList.add(detailvo);
			}
		// 한개만 예약할 때
		} else if(cartNos == null) {
			if(vo.getPayMethod().equals("신용카드")) {
				dvo.setBookStatus("예약완료");
			} else {
				dvo.setBookStatus("예약대기");
			}
			bookDetailList.add(dvo);
		}
		if(vo.getPayMethod().equals("신용카드")) {
			// 신용카드 선택했을 때는 결제완료
			vo.setPayStatus("결제완료");
		} else {
			// 무통장입금 선택했을 때는 결제대기 - 관리자 확인 필요
			vo.setPayStatus("결제대기");
		}
		vo.setBookDetailList(bookDetailList);
		Integer result = service.book(vo);
		// 장바구니 삭제처리
		if(cartNos != null && result != null) {
			List<Long> list = Arrays.asList(cartNos);
			cartService.delete(list);
		}
		return "redirect:list.do";
	}
	
	@GetMapping("/modify.do")
	public String modifyForm(Long no, Model model) {
		model.addAttribute("vo", service.view(no));
		return module + "/modify";
	}
	
	@PostMapping("/modify.do")
	public String modify(BookVO vo) {
		service.bookInfoUpdate(vo);
		return "redirect:view.do?no="+vo.getNo();
	}
	
	@PostMapping(value="/tourComplete.do", produces = MediaType.APPLICATION_JSON_VALUE )
	@ResponseBody
	public ResponseEntity<String> tourComplete(Long no) {
		log.info("투어완료처리");
		int result = service.tourComplete(no);
		if(result != 0) {
			return new ResponseEntity<String>("1", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("2", HttpStatus.OK);
		}
	}
}
