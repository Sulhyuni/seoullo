package com.seoullo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.seoullo.member.vo.MemberVO;
import com.seoullo.review.service.ReviewService;
import com.seoullo.review.vo.ReviewVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review")
@Log4j
public class ReviewController {

	String path = "/upload/review";

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService service;

	// 후기
	// --------------------------------------------------------------------------------------------------------

	@RequestMapping("/list.do")
	public String list(@ModelAttribute("pageObject") PageObject pageObject, Model model) {
		model.addAttribute("list", service.list(pageObject));
		return "review/list";
	}
	
	@RequestMapping("/myList.do")
	public String myList(@ModelAttribute("pageObject") PageObject pageObject, HttpSession session, Model model) {
		String id = ((MemberVO) session.getAttribute("login")).getId();
		model.addAttribute("list", service.myList(id, pageObject));
		return "review/myList";
	}

	@RequestMapping("/view.do")
	public String view(long revNo, int inc, HttpSession session, Model model) {
		model.addAttribute("vo", service.view(revNo, inc));
		model.addAttribute("list", service.viewImage(revNo));
		// 로그인했을 경우
		if (session.getAttribute("login") != null) {
			// 로그인 아이디를 id라는 변수로 지정
			String id = ((MemberVO) session.getAttribute("login")).getId();
			// vo에 id와 revNo를 저장
			ReviewVO vo = new ReviewVO();
			vo.setId(id);
			vo.setRevNo(revNo);
			// likeCheck 서비스를 호출해 vo(id, revNo)를 전달, check라는 변수에 boolean 결과가 저장
			Boolean check = service.likeCheck(vo);
			// null을 반환하는 것을 방지
			if (check != null) {
				model.addAttribute("check", check);
			}
		}
		return "review/view";
	}

	@GetMapping("/writeReview.do")
	public String writeReviewForm() {
		return "review/writeReview";
	}

	@PostMapping("/writeReview.do")
	public String writeReview(ReviewVO vo, Integer thumbnail, MultipartFile[] img, HttpSession session,
			HttpServletRequest request) throws Exception {
		// 파일 정보를 저장하는 리스트(imgName, thumbnail)
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		String id = ((MemberVO) session.getAttribute("login")).getId();
		for (int i = 0; i < img.length; i++) {
			MultipartFile multi = img[i];
			if (!multi.isEmpty()) {
				ReviewVO vo2 = new ReviewVO();
				vo2.setImgName(FileUtil.upload(path, multi, request));
				vo2.setThumbnail((i == thumbnail) ? 1 : 0);
				list.add(vo2);
			}
		}
		service.writeReview(vo, list);
		// 시간 딜레이
		Thread.sleep(500);
		return "redirect:list.do";
	}

	@GetMapping("/writeAnswer.do")
	public String wrtieAnswerForm(long revNo, Model model) {
		model.addAttribute("vo", service.view(revNo, 0));
		return "review/writeAnswer";
	}

	@PostMapping("/writeAnswer.do")
	public String writeAnswer(ReviewVO vo) {
		service.writeAnswer(vo);
		return "redirect:list.do";
	}

	@GetMapping("/update.do")
	public String updateForm(long revNo, Model model) {
		model.addAttribute("vo", service.view(revNo, 0));
		return "review/update";
	}

	@PostMapping("/update.do")
	public String update(ReviewVO vo) {
		service.update(vo);
		return "redirect:view.do?revNo=" + vo.getRevNo() + "&inc=0";
	}

	@GetMapping("/deleteReview.do")
	public String deleteReview(long refNo, long bookNo, HttpServletRequest request) throws Exception {
		// 삭제할 파일 정보 가져오기
		List<ReviewVO> list = service.viewImage(refNo);
		// DB에서 정보 삭제
		int result = service.deleteReview(refNo, bookNo);
		// 서버에서 파일 삭제
		if (result == 1) {
			for (ReviewVO vo : list) {
				FileUtil.remove(FileUtil.getRealPath("/", vo.getImgName(), request));
			}
		}
		return "redirect:list.do";
	}

	@GetMapping("/deleteAnswer.do")
	public String deleteAnswer(long revNo) {
		service.deleteAnswer(revNo);
		return "redirect:list.do";
	}

	// 후기 이미지
	// --------------------------------------------------------------------------------------------------------

	@PostMapping("/updateImage.do")
	public String updateImage(ReviewVO vo, String deleteImgName, PageObject pageObject, MultipartFile updateImage,
			HttpServletRequest request) throws Exception {
		// 파일 업로드
		vo.setImgName(FileUtil.upload(path, updateImage, request));
		// DB 변경
		int result = service.updateImage(vo);
		// 기존 파일 삭제
		if (result == 1) {
			String realPath = FileUtil.getRealPath("/", deleteImgName, request);
			FileUtil.remove(FileUtil.getRealPath("/", deleteImgName, request));
		}
		// 처리 후 이동
		return "redirect:view.do?revNo=" + vo.getRevNo() + "&inc=0" + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word=" + pageObject.getWord();
	}

	@GetMapping("/updateImageThm.do")
	public String updateImageThm(ReviewVO vo, PageObject pageObject) {
		int result = service.updateImageThm(vo.getRevNo(), vo.getImgNo());
		return "redirect:view.do?revNo=" + vo.getRevNo() + "&inc=0" + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word=" + pageObject.getWord();
	}

	@GetMapping("/deleteImage.do")
	public String deleteImage(long imgNo, long revNo, String deleteImage, PageObject pageObject,
			HttpServletRequest request) throws Exception {
		// DB에서 정보 삭제
		int result = service.deleteImage(imgNo);
		// 서버에서 파일 삭제
		if (result == 1) {
			FileUtil.remove(FileUtil.getRealPath("/", deleteImage, request));
		}
		return "redirect:view.do?revNo=" + revNo + "&inc=0" + "&page=" + pageObject.getPage() + "&perPageNum="
				+ pageObject.getPerPageNum() + "&key=" + pageObject.getKey() + "&word=" + pageObject.getWord();
	}

	// 후기 추천
	// --------------------------------------------------------------------------------------------------------

	@PostMapping("/writeLike.do")
	public String writeLike(ReviewVO vo) {
		service.writeLike(vo);
		return "redirect:view.do?revNo=" + vo.getRevNo() + "&inc=0";
	}

	@PostMapping("/deleteLike.do")
	public String deleteLike(ReviewVO vo) {
		service.deleteLike(vo);
		return "redirect:view.do?revNo=" + vo.getRevNo() + "&inc=0";
	}

	// 탭 내 후기
	// --------------------------------------------------------------------------------------------------------

	@RequestMapping("/listTab.sub")
	public String listTab(PageObject pageObject, long tourNo, Model model) {
		model.addAttribute("list", service.listTab(pageObject, tourNo));
		return "review/listTab";
	}

	@RequestMapping("/viewTab.sub")
	public String viewTab(long revNo, int inc, Model model) {
		model.addAttribute("vo", service.view(revNo, inc));
		// model.addAttribute("tab", 1);
		return "review/viewTab";
	}

}
