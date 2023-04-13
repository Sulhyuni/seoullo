package com.seoullo.tour.controller;

import java.net.URLDecoder;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.seoullo.tour.service.TourService;
import com.seoullo.tour.vo.ScheduleVO;
import com.seoullo.tour.vo.TourVO;
import com.seoullo.tour.vo.TourdateVO;
import com.seoullo.tour.vo.TourpointVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/tourlist")
public class TourListController {

	String path = "/upload/tour";

	@Autowired
	@Qualifier("TourServiceImpl")
	private TourService service;

	// 조회수순 정렬: 리스트 데이터를 받아 조회수 기준으로 정렬 후 다시 보냄
	@PostMapping(value = "/arraybyhit.do", consumes = "application/json")
	public ResponseEntity<List<TourVO>> arrayByHit(@RequestBody String list, Model model) {

		List<TourVO> tourList = null;
		try {
			tourList = convert(list);
		} catch (Exception e) {
			return null;
		}
		Collections.sort(tourList, TourVO.byHit);
		model.addAttribute("list", tourList);
		return new ResponseEntity<List<TourVO>>(tourList, HttpStatus.OK);
	}

	// 등록일순 정렬: 리스트 데이터를 받아 등록일 기준으로 정렬 후 다시 보냄
	@PostMapping(value = "/arraybyregdate.do", consumes = "application/json")
	public ResponseEntity<List<TourVO>> arrayByRegdate(@RequestBody String list, Model model) throws Exception {

		List<TourVO> tourList = null;
		try {
			tourList = convert(list);
		} catch (Exception e) {
			return null;
		}
		Collections.sort(tourList, TourVO.byRegdate);
		model.addAttribute("list", tourList);
		return new ResponseEntity<List<TourVO>>(tourList, HttpStatus.OK);
	}

	// 마감 제외: 리스트 데이터를 받아 마감 제외 필터링 후 다시 보냄
	@PostMapping(value = "/exceptClosed.do", consumes = "application/json")
	public ResponseEntity<List<TourVO>> exceptClosed(@RequestBody String list, Model model) throws Exception {

		List<TourVO> tourList = null;
		try {
			tourList = convert(list);
		} catch (Exception e) {
			return null;
		}
		tourList.removeIf(i -> i.getStatus().equals("마감"));
		model.addAttribute("list", tourList);
		return new ResponseEntity<List<TourVO>>(tourList, HttpStatus.OK);
	}

	// 마감 포함: 기존에 검색했던 기준대로 다시 검색하여 리스트를 반환
	@RequestMapping(value = "/includeClosed.do")
	public ResponseEntity<List<TourVO>> includeClosed(String searchKey, String searchWord, String region, Model model)
			throws Exception {
		List<TourVO> list = service.list(searchKey, searchWord, region, 1);
		if (searchWord != null && searchWord != "") {
			if (searchKey.equals("title"))
				list = service.list(null, searchWord, region, 1);
			else if (searchKey.equals("tag"))
				list = service.list(searchWord, null, region, 1);
			else
				list = service.list(null, null, region, 1);
		} else
			list = service.list(null, null, region, 1);
		model.addAttribute("list", list);
		return new ResponseEntity<List<TourVO>>(list, HttpStatus.OK);
	}

	// 문자열 형식으로 들어온 데이터를 List<TourVO>로 변환하는 작업
	private List<TourVO> convert(String list) throws Exception {
		list = URLDecoder.decode(list, "UTF-8");
		List<TourVO> tourList = new ArrayList<TourVO>();
		String[] lists = list.substring(12, list.length() - 1).split(", TourVO");
		for (String str : lists) {
			TourVO vo = new TourVO();
			String[] strs = str.split(", ", 21);
			String var = strs[0].substring(strs[0].indexOf("=") + 1);
			vo.setNo(Long.parseLong(var));
			var = strs[1].substring(strs[1].indexOf("=") + 1);
			vo.setHit(Long.parseLong(var));

			// 날짜
			var = strs[2].substring(strs[2].indexOf("=") + 5);
			var = var.replace("Jan", "01");
			var = var.replace("Fab", "02");
			var = var.replace("Mar", "03");
			var = var.replace("Apr", "04");
			var = var.replace("May", "05");
			var = var.replace("Jun", "06");
			var = var.replace("Jul", "07");
			var = var.replace("Aug", "08");
			var = var.replace("Sep", "09");
			var = var.replace("Oct", "10");
			var = var.replace("Nov", "11");
			var = var.replace("Dec", "12");
			DateFormat df = new SimpleDateFormat("MM dd HH:mm:ss zzz yyyy");
			vo.setRegdate(df.parse(var));
			vo.setStatus(strs[3].substring(strs[3].indexOf("=") + 1));
			vo.setType(strs[4].substring(strs[4].indexOf("=") + 1));
			vo.setTitle(strs[5].substring(strs[5].indexOf("=") + 1));
			vo.setDescription(strs[6].substring(strs[6].indexOf("=") + 1));
			vo.setThumbnail(strs[9].substring(strs[9].indexOf("=") + 1));

			// 태그리스트 세팅
			String[] tags = strs[20].substring(strs[20].indexOf("[") + 1, strs[20].indexOf("]")).split(", ");
			vo.setTagList(Arrays.asList(tags));

			tourList.add(vo);
		}
		return tourList;
	}

	// 미리보기
	@PostMapping(value = "/preview.do")
	public ResponseEntity<TourVO> preview(MultipartFile thumbnailFile, MultipartFile mainImgFile,
			MultipartFile subImgFile, TourVO vo, String[] day, Integer[] maxNum, Integer[] priceA, Integer[] priceB,
			Integer[] dayNum, Integer[] starthour, Integer[] startminute, String[] schedule, String[] schDescription,
			MultipartFile[] pointImageFile, String[] pointTitle, String[] pointContent, String tags,
			String[] checkpoint, HttpServletRequest request, HttpSession session) throws Exception {
		try {
			TourVO oldVO = null;
			if (vo.getNo() != null) {
				oldVO = service.view(vo.getNo(), 0);
			}
			// thumbnail, mainImg, subImg 저장 처리
			vo.setThumbnail(TourController.upload(path, thumbnailFile, request));
			if (oldVO != null && vo.getThumbnail().equals("/upload/tour/noImage.jpg"))
				vo.setThumbnail(oldVO.getThumbnail());
			vo.setMainImg(TourController.upload(path, mainImgFile, request));
			if (oldVO != null && vo.getMainImg().equals("/upload/tour/noImage.jpg"))
				vo.setMainImg(oldVO.getMainImg());
			vo.setSubImg(TourController.upload(path, subImgFile, request));
			if (oldVO != null && vo.getSubImg().equals("/upload/tour/noImage.jpg"))
				vo.setSubImg(oldVO.getSubImg());
			
			System.out.println(vo);
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
				tourpointVO.setImage(TourController.upload(path, pointImageFile[i], request));
				if (oldVO != null && tourpointVO.getImage().equals("/upload/tour/noImage.jpg"))
					tourpointVO.setImage(oldVO.getTourpointList().get(i).getImage());
				tourpointVO.setTitle(pointTitle[i]);
				tourpointVO.setContent(pointContent[i]);
				tourpointList.add(tourpointVO);
			}
			vo.setTourpointList(tourpointList);

			// tag 세팅
			vo.setTagList(Arrays.asList(tags.split(",")));

			// checkpoint 세팅
			List<String> checkpointList = new ArrayList<String>();
			for (int i = 0; i < checkpoint.length; i++) {
				checkpointList.add(checkpoint[i]);
			}
			vo.setCheckpointList(checkpointList);

		} catch (ParseException e) {
			System.out.println("parse 안됨");
		}
		session.setAttribute("vo", vo);
		return new ResponseEntity<TourVO>(vo, HttpStatus.OK);
	}

}
