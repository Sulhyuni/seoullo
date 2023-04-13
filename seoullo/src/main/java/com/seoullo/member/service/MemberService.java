package com.seoullo.member.service;


import java.util.List;

import com.seoullo.member.vo.MemberVO;
import com.seoullo.member.vo.PaymentVO;
import com.webjjang.util.PageObject;


public interface MemberService {
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//운영자의 리스트
	public List<MemberVO>list(PageObject pageObject);
	
	//운영자, 일반회원, 가이드의  상세정보 보기
	public MemberVO view(String id);
	public MemberVO guideView(String id);
	
	//가이드의 결제정보 리스트
	public List<MemberVO>guideList(String id);
	//회원가입
	public int commonWelcom(MemberVO vo);
	
	//가이드 회원가입 
	public int guideWelcom(MemberVO vo , PaymentVO pvo);
	
	//가이드, 일반회원의 정보변경
	public int update(MemberVO vo);
	//가이드, 일반회원의 정보변경
	public int guideUpdate(MemberVO vo);
	
	public int addPay(PaymentVO pvo, String id,String pw, int gradeNo);
	//운영자의 정보변경
	public int updateAdmin(String id, String status);
	
	//회원탈퇴
	public int delete(String id, String pw);
	

	//아이디 찾기 검색의 결과값이 있어야 해서 int로 넣기
	public String findId(String name, String email);
	
	//비밀번호 찾기  검색의 결과값이 있어야 해서 int로 넣기
	public String findPw(String name,String id, String email);
	//비밀번호 변경
	public int updatePw(MemberVO vo);
	
	public int statusNomal(String id, String pw);
	
	//휴면상태 만들기
	public int updateHu();
	
	public int updatePay();
	
	// 아작스 라인----
	
	//아이디 중복검사
	public int checkId(String id);
	
	//닉네임 중복검사
	public int checkNickName(String nickName);
	
//	//비밀번호가 맞는지 체크
//	public int checkPw(String id, String pw);

	

	
	
	
	

}
