package com.seoullo.event.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.seoullo.event.service.EventService;
import com.seoullo.event.vo.ApplyEventVO;
import com.seoullo.event.vo.EventVO;
import com.seoullo.event.vo.ImgfileVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/event")
public class EventController {
	
	//파일 경로 선언
	String path ="/upload/event";
	
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService service;
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute PageObject pageObject,Model model){
		log.info("이벤트 리스트---------------------");
		pageObject.setPerPageNum(9);
		model.addAttribute("list", service.list(pageObject));
		return "event/list";
	}
	
	@RequestMapping("/view.do")
	public String view(Long no,Model model,int inc) {
		log.info("이벤트 게시판 보기-----------------");
		
		   
	//	 EventVO vo=service.view(no, inc);
		//파일과 text 데이터 가져오기. 
		model.addAttribute("vo", service.view(no, inc));
		model.addAttribute("list", service.viewFile(no));
	
		
		
		return "event/view";
	}
	@GetMapping("/write.do")
	public String writeForm() {
		log.info("이벤트 등록 폼  -----------------");

		return "event/write";
	}
	
	@PostMapping("/write.do")
	public String write(EventVO vo,MultipartFile[] img,int main ,HttpServletRequest request) throws Exception {
	    log.info("이벤트 등록 처리 -----------------");
	    
	    List<ImgfileVO>list = new ArrayList<ImgfileVO>();

		log.info(img);

	    log.info("vo++++++++++++++" + vo);
	    log.info("main++++++++++++++" + main);
	    log.info("filename++++++++++++++" + request);
//	    String fileName = FileUtil.upload(path, vo.getFilename(), request);
//		vo.setFileName(fileName);
	    // 이미지 파일 여러개 올리기
	    for (int i = 0; i < img.length; i++) {
	        MultipartFile mm = img[i];
	        if (!mm.isEmpty()) {
	            ImgfileVO ivo = new ImgfileVO();
	            ivo.setFilename(FileUtil.upload(path, mm, request));
	            ivo.setMain((i == main) ? 1 : 0);
	            list.add(ivo);
	            log.info("/*/*/*/*/*/*/*/*/*"+list);
	        }
	    }
	    //db 저장
	   service.write(vo, list);

	    Thread.sleep(500);
	    return "redirect:list.do";
	}
	@GetMapping("/update.do")
	public String updateForm(long no, Model model){
		log.info("이벤트 수정 폼 -----------------");
		model.addAttribute("vo", service.view(no, 0));
		return "event/update";
		
	}
	@PostMapping("/update.do")
	public String update(EventVO vo, PageObject pageObject){
		log.info("이벤트 수정 처리 -----------------");
		int result = service.update(vo);
		return "redirect:view.do?no="+vo.getE_no()+"&inc=0"+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum()+"&key="+pageObject.getKey()+"&word="+pageObject.getWord();
		
		
	}
	@PostMapping("/update2.do")
	public String updateFile(ImgfileVO vo,String dFile,MultipartFile ufile,HttpServletRequest request,PageObject pageObject) throws Exception {
		  log.info("이벤트 이미지 수정 처리 -----------------");
		    if (ufile != null && !ufile.isEmpty()) { // 새로운 파일이 업로드된 경우
		        vo.setFilename(FileUtil.upload(path, ufile, request));
		       service.updateFile(vo);

		        if (!StringUtils.isEmpty(dFile)) { // 기존 파일 삭제
		            FileUtil.remove(FileUtil.getRealPath("/", dFile, request));
		        }
		    } else { // 새로운 파일이 업로드되지 않은 경우
		        vo.setFilename(dFile); // 이전에 업로드된 파일명 유지
		    }

		 
		return "redirect:view.do?no="+vo.getE_no()+"&inc=0"+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum()+"&key="+pageObject.getKey()+"&word="+pageObject.getWord();
	}
	//메인 사진 변경
	@GetMapping("/update3.do")
	public String update3(ImgfileVO vo,PageObject pageObject){
		log.info("메인 이미지 수정  -----------------");
		log.info("-----------------"+vo);
		log.info("++++++++++++++++"+vo.getE_no());
		log.info("++++++++++++++++"+vo.getFileno());
		//int e_no=43;
		int result = service.main(vo.getE_no(), vo.getFileno());
		return "redirect:list.do?no="+vo.getE_no()+"&inc=0"+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum()+"&key="+pageObject.getKey()+"&word="+pageObject.getWord();
	}
	
	@GetMapping("/deleteF.do")
	public String deleteF(Long mno,Long no,PageObject pageObject,String dFile,HttpServletRequest request) throws Exception {
		log.info("사진 삭제  -----------------");
		int result = service.deleteFile(mno);
		if(result==1) {
		FileUtil.remove(FileUtil.getRealPath("/", dFile, request));
		}
		return "redirect:view.do?no="+no+"&inc=0"+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum()+"&key="+pageObject.getKey()+"&word="+pageObject.getWord();
	}
	@GetMapping("/delete.do")
	public String delete(long no,PageObject pageObject) {
		log.info("게시판 삭제  -----------------");
		int result = service.delete(no);
		return "redirect:list.do?&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum();
				
	}
	
	@GetMapping("/apply2.do")
	public String apply2(ApplyEventVO vo, HttpSession session,Model model) {
	    log.info("이벤트 참여 여부  -----------------");
	    String id = session.getId();
	     service.apply2(vo);
		    
	    return "redirect:view.do?no="+vo.getE_no();
	}
	


}
