package com.seoullo.tour.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.seoullo.member.vo.MemberVO;
import com.seoullo.tour.service.TourService;
import com.seoullo.tour.service.TourServiceImpl;
import com.seoullo.tour.vo.ScheduleVO;
import com.seoullo.tour.vo.TourVO;
import com.seoullo.tour.vo.TourdateVO;
import com.seoullo.tour.vo.TourpointVO;
import com.webjjang.util.file.FileUtil;

@Controller
@RequestMapping("/tour")
public class TourController {

	String path = "/upload/tour";

	@Autowired
	@Qualifier("TourServiceImpl")
	private TourService service;

	// 투어 리스트
	@RequestMapping("/list.do")
	public String list(String searchKey, String searchWord, String region, HttpSession session, Model model) {
		MemberVO loginVO = (MemberVO) session.getAttribute("login");

		if (loginVO != null) {
			Integer grade = loginVO.getGradeNo();

			// 가이드 등급일 경우 가이드 본인의 리스트로 이동
			if (grade != null && (grade == 2 || grade == 3)) {
				String id = loginVO.getId();
				model.addAttribute("list", service.listByGuide(id));
				return "tour/listByGuide";

			}
		}
		// 가이드 등급이 아닐 경우 일반적인 전체 리스트로 이동

		// key에 태그, word에 제목 검색어 입력
		if (searchWord != null && searchWord != "") {
			if (searchKey.equals("title"))
				model.addAttribute("list", service.list(null, searchWord, region, 1));
			else if (searchKey.equals("tag"))
				model.addAttribute("list", service.list(searchWord, null, region, 1));
			else
				model.addAttribute("list", service.list(null, null, region, 1));
		} else
			model.addAttribute("list", service.list(null, null, region, 1));
		return "tour/list";
	}

	// 상세보기
	@RequestMapping("/view.do")
	public String view(Long no, Model model) {
		model.addAttribute("tourvo", service.view(no, 1));
		return "tour/view";
	}

	// 미리보기
	@RequestMapping("/preview.do")
	public String preview(HttpSession session, Model model) throws Exception {
		model.addAttribute("tourvo", session.getAttribute("vo"));
		session.removeAttribute("vo");
		return "tour/preview";
	}

	// 투어 등록 폼 화면
	@GetMapping("/write.do")
	public String write(Model model) {
		return "tour/write";
	}

	// 투어 등록 기능
	@PostMapping("/write.do")
	public String write(MultipartFile thumbnailFile, MultipartFile mainImgFile, MultipartFile subImgFile, TourVO vo,
			String[] day, Integer[] maxNum, Integer[] priceA, Integer[] priceB, Integer[] dayNum, Integer[] starthour,
			Integer[] startminute, String[] schedule, String[] schDescription, MultipartFile[] pointImageFile,
			String[] pointTitle, String[] pointContent, String tags, String[] checkpoint, HttpServletRequest request,
			Model model) throws Exception {
		try {
			// thumbnail, mainImg, subImg 저장 처리
			vo.setThumbnail(upload(path, thumbnailFile, request));
			vo.setMainImg(upload(path, mainImgFile, request));
			vo.setSubImg(upload(path, subImgFile, request));

			// tourdateList 세팅
			List<TourdateVO> tourdateList = new ArrayList<TourdateVO>();
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (int i = 0; i < day.length; i++) {
				TourdateVO tourdateVO = new TourdateVO();
				tourdateVO.setDay(sdf.parse(day[i]));
				tourdateVO.setMaxNum(maxNum[i]);
				tourdateVO.setPriceA(priceA[i]);
				tourdateVO.setPriceB(priceB[i]);
				tourdateList.add(tourdateVO);
			}
			vo.setTourdateList(tourdateList);

			// scheduleList 세팅
			List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();

			// 며칠까지 있는지: 타입에서 가져옴
			int maxDay = 1;
			if (!vo.getType().equals("당일")) {
				maxDay = vo.getType().charAt(2) - 48;
			}
			// maxDay마다 for문 돌림
			for (int i = 1; i <= maxDay; i++) {
				int scheduleNum = 0;
				for (int j = 0; j < dayNum.length; j++) {
					if (dayNum[j] == i) {
						ScheduleVO scheduleVO = new ScheduleVO();
						scheduleVO.setDayNum(dayNum[j]);
						scheduleVO.setScheduleNum(++scheduleNum);
						scheduleVO.setStarthour(starthour[j]);
						scheduleVO.setStartminute(startminute[j]);
						scheduleVO.setSchedule(schedule[j]);
						scheduleVO.setDescription(schDescription[j]);
						scheduleList.add(scheduleVO);
					}
				}
			}
			vo.setScheduleList(scheduleList);

			// tourpoint 세팅
			List<TourpointVO> tourpointList = new ArrayList<TourpointVO>();
			for (int i = 0; i < pointTitle.length; i++) {
				TourpointVO tourpointVO = new TourpointVO();
				tourpointVO.setImage(upload(path, pointImageFile[i], request));
				tourpointVO.setTitle(pointTitle[i]);
				tourpointVO.setContent(pointContent[i]);
				tourpointList.add(tourpointVO);
			}
			vo.setTourpointList(tourpointList);

			// tag 세팅
			List<String> tagList = Arrays.asList(tags.split(","));
			Collections.reverse(tagList);
			vo.setTagList(tagList);

			// checkpoint 세팅
			List<String> checkpointList = new ArrayList<String>();
			for (int i = 0; i < checkpoint.length; i++) {
				checkpointList.add(checkpoint[i]);
			}
			vo.setCheckpointList(checkpointList);

			service.write(vo);
		} catch (ParseException e) {
			System.out.println("parse 안됨");
		}
		return "redirect:/tour/list.do";
	}

	// 수정폼
	@GetMapping("/update.do")
	public String updateForm(Long no, HttpSession session, Model model) {
		TourVO vo = service.view(no, 0);
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (vo.getGuideId().equals(login.getId())) {

			// 태그리스트 -> String
			String tags = "";
			for (String tag : vo.getTagList()) {
				tags += tag;
				tags += ",";
			}
			model.addAttribute("tags", tags.substring(0, tags.lastIndexOf(",")));

			// tourdate의 day 형식 -> String으로 status에 저장
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for (TourdateVO dateVO : vo.getTourdateList()) {
				dateVO.setStatus(sdf.format(dateVO.getDay()));
			}

			// 일정리스트 형식
			List<List<ScheduleVO>> scList = new ArrayList<List<ScheduleVO>>();
			if (vo.getType().equals("당일"))
				scList.add(new ArrayList<ScheduleVO>());
			else {
				for (int i = 0; i < vo.getType().charAt(2) - 48; i++) {
					scList.add(new ArrayList<ScheduleVO>());
				}
			}

			int dayn = 1;
			for (List<ScheduleVO> scpdList : scList) {
				for (ScheduleVO svo : vo.getScheduleList()) {
					if (svo.getDayNum() == dayn)
						scpdList.add(svo);
				}
				dayn++;
			}
			model.addAttribute("scList", scList);

			model.addAttribute("tourvo", vo);
			return "tour/update";
		}
		return "redirect:/tour/list.do";
	}

	// 투어 수정 기능
	@PostMapping("/update.do")
	public String update(MultipartFile thumbnailFile, MultipartFile mainImgFile, MultipartFile subImgFile, TourVO vo,
			Integer[] dayNum, Integer[] starthour, Integer[] startminute, String[] schedule, String[] schDescription,
			MultipartFile[] pointImageFile, String[] pointTitle, String[] pointContent, String tags,
			String[] checkpoint, HttpServletRequest request, Model model) throws Exception {
		try {
			Long no = vo.getNo();
			TourVO oldVO = service.view(no, 0);

			boolean changeImage = false;
			// thumbnail, mainImg, subImg 저장 처리 (입력했으면)
			if (thumbnailFile != null && !thumbnailFile.getOriginalFilename().equals("")) {
				vo.setThumbnail(upload(path, thumbnailFile, request));
				changeImage = true;
			} else
				vo.setThumbnail(oldVO.getThumbnail());
			if (mainImgFile != null && !mainImgFile.getOriginalFilename().equals("")) {
				vo.setMainImg(upload(path, mainImgFile, request));
				changeImage = true;
			} else
				vo.setMainImg(oldVO.getMainImg());
			if (subImgFile != null && !subImgFile.getOriginalFilename().equals("")) {
				vo.setSubImg(upload(path, subImgFile, request));
				changeImage = true;
			} else
				vo.setSubImg(oldVO.getSubImg());

			// scheduleList 세팅 : 변동이 있으면 다 지우고 다시 등록
			List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();

			// 며칠까지 있는지: 타입에서 가져옴
			int maxDay = 1;
			if (!vo.getType().equals("당일")) {
				maxDay = vo.getType().charAt(2) - 48;
			}
			// maxDay마다 for문 돌림
			for (int i = 1; i <= maxDay; i++) {
				int scheduleNum = 0;
				for (int j = 0; j < dayNum.length; j++) {
					if (dayNum[j] == i) {
						ScheduleVO scheduleVO = new ScheduleVO();
						scheduleVO.setDayNum(dayNum[j]);
						scheduleVO.setScheduleNum(++scheduleNum);
						if (starthour[j] != null && !starthour[j].equals(""))
							scheduleVO.setStarthour(starthour[j]);
						if (startminute[j] != null && !startminute[j].equals(""))
							scheduleVO.setStartminute(startminute[j]);
						scheduleVO.setSchedule(schedule[j]);
						if (schDescription[j] != null && !schDescription[j].equals(""))
							scheduleVO.setDescription(schDescription[j]);
						scheduleList.add(scheduleVO);
					}
				}
			}
			vo.setScheduleList(scheduleList);
			boolean changeSchedule = !vo.getScheduleList().toString().equals(oldVO.getScheduleList().toString());

			// tourpoint 세팅 : 변동이 있으면 다 지우고 다시 등록
			boolean changeTourpoint = false;
			List<TourpointVO> tourpointList = new ArrayList<TourpointVO>();
			for (int i = 0; i < pointTitle.length; i++) {
				if (pointImageFile[i] == null || pointImageFile[i].getOriginalFilename().equals("")) {
					changeTourpoint = false;
					break;
				}
				TourpointVO tourpointVO = new TourpointVO();
				tourpointVO.setImage(upload(path, pointImageFile[i], request));
				tourpointVO.setTitle(pointTitle[i]);
				tourpointVO.setContent(pointContent[i]);
				tourpointList.add(tourpointVO);
				changeTourpoint = true;
			}
			vo.setTourpointList(tourpointList);

			// tag 세팅 : 변동이 있으면 다 지우고 다시 등록
			List<String> tagList = Arrays.asList(tags.split(","));
			boolean changeTag = !(tagList.toString().equals(oldVO.getTagList().toString()));
			Collections.reverse(tagList);
			vo.setTagList(tagList);

			// checkpoint 세팅 : 변동이 있으면 다 지우고 다시 등록
			List<String> checkpointList = new ArrayList<String>();
			for (int i = 0; i < checkpoint.length; i++) {
				checkpointList.add(checkpoint[i]);
			}
			vo.setCheckpointList(checkpointList);
			boolean changeCheckpoint = !(vo.getCheckpointList().toString()
					.equals(oldVO.getCheckpointList().toString()));
			service.update(vo, changeImage, changeSchedule, changeTourpoint, changeTag, changeCheckpoint);
		} catch (ParseException e) {
			System.out.println("parse 안됨");
		}
		return "redirect:/tour/list.do";
	}

	// 모집종료 메서드
	@RequestMapping("/close.do")
	public String close(Long no) {
		service.close(no);
		return "redirect:/tour/list.do";
	}

	// 투어 등록용 파일 업로드 메서드(기존 FileUtil에서 log 없애려고 새로 만듦)
	public static String upload(final String PATH, MultipartFile multiFile, HttpServletRequest request)
			throws Exception {
		String fileFullName = "";
		if (multiFile != null && !multiFile.getOriginalFilename().equals("")) {
			String fileName = multiFile.getOriginalFilename();
			String uploadPath = FileUtil.getRealPath(PATH, fileName, request);
			if(TourServiceImpl.uploadPath == null) {
				TourServiceImpl.uploadPath = uploadPath.substring(0, uploadPath.lastIndexOf("\\")+1);
				System.out.println("uploadPath: " + TourServiceImpl.uploadPath);
			}
			File saveFile = FileUtil.noDuplicate(uploadPath);
			fileFullName = PATH + "/" + saveFile.getName();
			multiFile.transferTo(saveFile);
		} else {
			fileFullName = PATH + "/" + "noImage.jpg";
		}
		return fileFullName;
	}
}
