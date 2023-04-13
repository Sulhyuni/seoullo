package com.seoullo.member.controller;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seoullo.member.service.MailSendService;
import com.seoullo.member.service.MemberService;
import com.seoullo.member.vo.MemberVO;
import com.seoullo.member.vo.PaymentVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	// **휴면 계정만들어야함!!!!

	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	@Autowired
	private MailSendService mailService;
	String mem = "member";

	// 로그인(memberVO)
		@GetMapping("/login.do")
		public String loginForm() {

			log.info("로그인 폼------------------------");

			return mem + "/login";
		}

		
		
		@PostMapping("/login.do")
		public String login(String id, String pw, HttpSession session, RedirectAttributes redirectAttributes) {
		    log.info("로그인 처리...........");
		    log.info("id=" + id + ",pw=" + pw);
		    MemberVO vo = new MemberVO();
		    vo.setId(id);
		    vo.setPw(pw);

		    session.setAttribute("login", service.login(vo));
		    log.info("로그인 되었어요~~~");

		    // 회원이 아니면 회원이 아니라고 표시해야함.
		    if (session.getAttribute("login") == null || session.getAttribute("login").equals("id")) {
		    	redirectAttributes.addAttribute("msg", "아이디나 비밀번호를 다시 확인하여 입력해주세요");
		        return "redirect:/mem/login"; 
		    } else {
		        // 로그인된 아이디의 status가 '휴면'인 경우
		        vo = (MemberVO) session.getAttribute("login");
		        if (vo.getStatus().equals("휴면")) {

		            return mem+"/updateHu"; 
		        } else if (vo.getStatus().equals("기간만료")) {

		            return mem+"/addPay"; 
		        } else {
		            // 메인 페이지로 이동
		        	//redirectAttributes.addAttribute("msg", "로그인 되었습니다!!");
		            return "redirect:/"; 
		        }
		    }
		}
		
		

		// 로그아웃 처리
		@GetMapping("/logout.do")
		public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
			session.removeAttribute("login");

			// 로그아웃 되었을때 로그아웃 되었다고 메시지 하나 뜨게만들기!

			log.info("로그아웃 되었어요~~~");
			// 메인으로
			//redirectAttributes.addAttribute("msg", "로그아웃 되었습니다!!");
			return "redirect:/";
		}
		
		

		@GetMapping("/myPage.do")
		public String myPage(HttpSession session, String id) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			id = vo.getId();
			log.info("마이페이지------------------------");

			return mem + "/myPage";
		}
	
		
		
		//회원가입 전단계(일반)
		@GetMapping("/checkPageCommon.do")
		public String checkPageCommon() {

			log.info("회원가입 전단계------------------------");

			return mem + "/checkPageCommon";
		}
		//가이드 회원가입 전단계
		@GetMapping("/checkPageGuide.do")
		public String checkGuideCommon() {
			
			log.info("회원가입 전단계------------------------");
			
			return mem + "/checkPageGuide";
		}
		
		// 가이드의 회원정보 쓰는 곳
		@GetMapping("/guideWelcom.do")
		public String guideWelcomForm() {
			log.info("가이드의 회원가입 폼===============");

			return mem + "/guideWelcom";
		}

		@PostMapping("/guideWelcom.do")
		public String guideWelcom(MemberVO vo, PaymentVO pvo,RedirectAttributes redirectAttributes) {
			
			log.info("가이드의 회원가입===============");
			service.guideWelcom(vo,pvo);
			//redirectAttributes.addAttribute("msg", "회원가입 되었습니다!!");
			return "redirect:/";
		}

		// 회원가입정보 쓰는 란
		@GetMapping("/commonWelcom.do")
		public String commonWelcomForm() {
			log.info("일반 회원가입 폼===============");

			return mem + "/commonWelcom";
		}

		@PostMapping("/commonWelcom.do")
		public String commonWelcom(MemberVO vo,RedirectAttributes redirectAttributes) {
			log.info("일반회원의 회원가입===============");
			
			System.out.println(vo);
			service.commonWelcom(vo);
			//redirectAttributes.addAttribute("msg", "회원가입 되었습니다!!");
			return "redirect:/";
		}

		// 운영자의 리스트 - id로 리스트를 뿌리고 운영자가 아니면 들어가지 못하게 하기.
		@RequestMapping("/list.do")
		public String list(String id, @ModelAttribute("pageObject")PageObject pageObject, Model model, HttpSession session) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			// id = vo.getId();
			vo.setGradeNo(9);

			log.info("리스트 찍어요~~~");

			model.addAttribute("list", service.list(pageObject));
			// 정보를 10개씩 띄우기
			pageObject.setPerPageNum(10);

			return mem + "/list";
		}

		// 상태변경
		@PostMapping("/updateAdmin.do")
		public String updateAdmin(String id, String status,RedirectAttributes redirectAttributes) {
			 service.updateAdmin(id, status);
			
    			//redirectAttributes.addAttribute("msg","정보가 수정 되었습니다!");
    			
			return "redirect:list.do";
		}

		// 가이드의 결제 리스트
		@GetMapping("/guideList.do")
		public String guideList(String id, Model model, HttpSession session) {
			log.info("가이드 리스트 찍어요~~~");
			MemberVO vo = (MemberVO) session.getAttribute("login");
//			if (vo.getGradeNo() == 2 || vo.getGradeNo() == 3) {
//
//				log.info("가이드 리스트 찍어요~~~ (member)");
//				id = vo.getId();
//				service.guideList(id);
//			} else {

				List<MemberVO> list = service.guideList(id);
				
				service.guideList(id);
				model.addAttribute("list", list);
			//}
			return mem + "/guideList";
		}
		

		// 일반회원의 상세보기 (MemberVO, paynentVO)'
		@RequestMapping("/view.do")
		public String view(String id, HttpSession session, Model model) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			if (vo.getGradeNo() == 1) {

				id = vo.getId();
			} else {
				log.info(vo);

				log.info("상세보기로 이동합니다===========");
			}
				model.addAttribute("vo", service.view(id));
				return mem + "/view";

		}

		// 가이드상세보기 (MemberVO, paynentVO)'
		@RequestMapping("/guideView.do")
		public String guideView(String id, HttpSession session, Model model) {
			MemberVO vo = (MemberVO) session.getAttribute("login");

			if (vo.getGradeNo() == 2 || vo.getGradeNo() == 3) {
				id = vo.getId();
				vo = service.guideView(id);
			} else {
				vo = service.guideView(id);
				log.info("상세보기로 이동합니다===========");
			}
			model.addAttribute("vo", vo);
			return mem + "/guideView";
		}

		// 일반회원 정보변경
		// updateForm
		@GetMapping("/update.do")
		public String updateForm(String id, HttpSession session, Model model) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			if (vo.getGradeNo() == 1) {

				id = vo.getId();
			} else {
				log.info(vo);
			}
			MemberVO updateVO = service.view(id);
			// 이메일 아이디만 넘어가게 하기위해 작성 @부터 제거
			String email = updateVO.getEmail();
			if (email != null) {
				int idx = email.indexOf("@");
				if (idx != -1) {
					email = email.substring(0, idx);

				}
				updateVO.setEmail(email);
				log.info("updateForm==========================");
			}

			model.addAttribute("view", updateVO);
			return mem + "/update";

		}

		// update
		@PostMapping("/update.do")
		public String update(MemberVO vo, String add, String email, HttpSession session, Model model,RedirectAttributes redirectAttributes) {
			vo.setEmail(email + add);
			log.info("update실행됨===============================");
			int result = service.update(vo);
			
//			if(result == 1) {
//    			redirectAttributes.addAttribute("msg","정보가 수정 되었습니다!");
//    			
//    		}else {
//    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다.. 다시한번 더 시도하시거나 사이트에 문의해주세요!");
//    		}
			
			return "redirect:view.do?id=" + vo.getId();

		}

		// 가이드, 일반회원 정보변경
		// updateForm
		@GetMapping("/guideUpdate.do")
		public String guideUpdateForm(String id, HttpSession session, Model model) {
			log.info("updateForm==========================");
			MemberVO vo = (MemberVO) session.getAttribute("login");
			if (vo.getGradeNo() == 2 || vo.getGradeNo() == 3) {

				id = vo.getId();
			} else {

				MemberVO guideUpdateVO = service.guideView(id);

				String email = guideUpdateVO.getEmail();
				if (email != null) {
					int idx = email.indexOf("@");
					if (idx != -1) {
						email = email.substring(0, idx);

					}

					guideUpdateVO.setEmail(email);
				}
				model.addAttribute("vo", guideUpdateVO);

			}
			return mem + "/update";
		}

		// update
		@PostMapping("/guideUpdate.do")
		public String guideUpdate(String id, String add, String email, HttpSession session,RedirectAttributes redirectAttributes) {
			MemberVO vo = new MemberVO();
			vo.setEmail(email + add);
			log.info("update실행됨===============================");
			int result = service.guideUpdate(vo);
			log.info("결과값= " + result);
			log.info("*********등급" + vo.getGradeNo());
//			if(result == 1) {
//    			redirectAttributes.addAttribute("msg","정보가 수정 되었습니다!");
//    			
//    		}else {
//    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다.. 다시한번 더 시도하시거나 사이트에 문의해주세요!");
//    		}

			return "redirect:guideView.do";

		}
		
		
		

		//회원의 탈퇴
		@GetMapping("/delete.do")
		public String deleteForm() {
			
			log.info(" 회원의 탈퇴form=============================");
			return mem + "/delete";
		}

		// 회원 탈퇴
		@PostMapping("/delete.do")
		public String delete(String id, HttpSession session, String pw, RedirectAttributes redirectAttributes) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			id = vo.getId();
			log.info("회원의 탈퇴post=============================");
			int result = service.delete(id,pw);
			log.info("결과값= " + result);
			
//			if(result == 1) {
//    			redirectAttributes.addAttribute("msg","탈퇴가 완료되었습니다! 안녕희 가세요!!");
//    			
//    		}else {
//    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다.. 다시한번 더 시도하시거나 사이트에 문의해주세요!");
//    		}
			session.removeAttribute("login");
			return "redirect:/";
		}
		
		//회원탈퇴 마지막 페이지 5초후에 사라지는 것
			@GetMapping("/deleteSuccess.do")
			public String deleteSuccess() {

		log.info("회원탈퇴 마지막페이지------------------------");

				return "redirect:/";
			}

		
		// 아이디찾기
		@GetMapping("/findId.do")
		public String findIdForm(MemberVO vo) {

			return mem + "/findId";
		}

		@PostMapping("/findId.do")
		public String findId(String name, String email, Model model) {

			String id = service.findId(name, email);

			model.addAttribute("id", id);

			return mem + "/findId_result";
		}

		
	//비밀번호찾기 폼
		@GetMapping("/findPw.do")
		public String findPwForm(MemberVO vo) {

			return mem + "/findPw";
		}

	//비밀번호 찾기
		@PostMapping("/findPw.do")
		public String findPw(String id, String name, String email, Model model) {

			String pw = service.findPw(id, name, email);

			model.addAttribute("pw", pw);

			return mem + "/findPw_result";
		}

		// 비밀번호 수정
		@GetMapping("/updatePw.do")
		public String updatePwForm() {
			
			
			log.info(" 회원의 비밀번호 수정form=============================");
			return mem + "/updatePw";
		}

		@PostMapping("/updatePw.do")
		public String updatePw(MemberVO vo, HttpSession session, RedirectAttributes redirectAttributes) {
			
			log.info(" 회원의 비밀번호 수정=============================");
			
			int result = service.updatePw(vo);
//			 if(result == 1) {
//	    			redirectAttributes.addAttribute("msg","비밀번호가 변경되었습니다!! 변경된 비밀번호로 로그인 해주세요!");
//	    			
//	    		}else {
//	    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다.. 다시한번 더 시도하시거나 사이트에 문의해주세요!");
//	    		}
			session.removeAttribute("login");
			return "redirect:login.do";
		}
		
		
		//휴면상태에서 정상으로 전환하기
		@GetMapping("/updateHu.do")
		public String updateHuForm(String id,HttpSession session) {
			
			log.info("휴면상태 변경form=============================");
			return mem + "/updateHu.do";
		}

		//휴면상태에서 정상으로 전환하기
		@PostMapping("/updateHu.do")
		public String updateHu(String id,HttpSession session, RedirectAttributes redirectAttributes, String pw) {
			MemberVO vo = (MemberVO) session.getAttribute("login");
			id = vo.getId();
			
			log.info("updateHu=============================");
             int result = service.statusNomal(id,pw);	
             
//            if(result == 1) {
//    			redirectAttributes.addAttribute("msg","정보가 변경되었습니다.");
//    			
//    		}else {
//    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다..사이트에 문의해주세요");
//    		}

			return "redirect:/";
		}
		
		//기간만료시에 재 결제 할때
			@GetMapping("/addPay.do")
			public String addPayForm(String id, HttpSession session) {
				
				log.info("가이드 재결제 form=============================");
				return mem + "/addPay.do";
			}

			@PostMapping("/addPay.do")
			public String addPay(String id, String pw,HttpSession session, PaymentVO pvo, int gradeNo, RedirectAttributes redirectAttributes) {
				MemberVO vo = (MemberVO) session.getAttribute("login");
				id = vo.getId();
				log.info("가이드 재결제 post=============================");
				int result = service.addPay(pvo, id,pw,gradeNo);
				log.info("결과값= " + result);
//				 if(result == 1) {
//		    			redirectAttributes.addAttribute("msg","결제가 완료되었습니다!.");
//		    			
//		    		}else {
//		    			redirectAttributes.addAttribute("msg", "처리되지 못하였습니다..사이트에 문의해주세요");
//		    		}

				
			   return "redirect:/";
			}
		
	
	//=======================================아작스 코드라인============================================================
	//이메일 인증
		@GetMapping(value ="/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			log.info("이메일 인증 요청이 들어옴!");
			log.info("이메일 인증 이메일 : " + email);
			
			return mailService.joinEmail(email);
		}
	
	
//현재 비밀번호 체크
//	@PostMapping(value = "/checkPw")
//	@ResponseBody // 아작스를 쓸때 아작스의 정보를 받는 어노테이션
//	public String checkPw(String pw ,String id,HttpSession session) {
//		MemberVO vo = (MemberVO) session.getAttribute("login");
//		id = vo.getId();
//		pw = vo.getPw();
//		
//		log.info("비밀번호 확인검사");
//		int result = service.checkPw(pw,id);
//		log.info("결과값= " + result);
//		if (result != 0) {
//			return "fail"; 
//		} else {
//
//			return "success"; 
//		}
//	}

	// 일반 회원가입
	// 가이드 회원가입

	// 닉네임 중복검사
	@PostMapping(value = "/checkNickName")
	@ResponseBody // 아작스를 쓸때 아작스의 정보를 받는 어노테이션
	public String checkNickName(String nickName) {
		log.info("닉네임 중복검사");
		int result = service.checkNickName(nickName);
		log.info("결과값= " + result);
		if (result != 0) {
			return "fail"; // 중복된 닉네임이 존재할때
		} else {

			return "success"; // 중복되는게 없을때
		}
	}

	// 아이디 중복검사
	@PostMapping(value = "/checkId")
	@ResponseBody // 아작스를 쓸때 아작스의 정보를 받는 어노테이션
	public String checkId(String id) {
		log.info("아이디 중복검사");
		int result = service.checkId(id);
		log.info("결과값= " + result);
		if (result != 0) {
			return "fail"; // 중복된 닉네임이 존재할때
		} else {

			return "success"; // 중복되는게 없을때
		}

		
	}
	
	
}
