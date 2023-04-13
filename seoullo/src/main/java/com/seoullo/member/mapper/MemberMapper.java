package com.seoullo.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.seoullo.member.vo.MemberVO;
import com.seoullo.member.vo.PaymentVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//운영자의 리스트
	public List<MemberVO>list(PageObject pageObject);
	
	//totalgetRow 페이지 갯수
	public long getTotalRow(PageObject pageObject);
	//가이드의 결제정보 리스트
	public List<MemberVO>guideList(String id);
	
	
	//운영자, 일반회원, 가이드의  상세정보 보기
	public MemberVO view(String id);
	
	public MemberVO guideView(String id);
	
	//아이디 찾기
	public String findId(@Param("name")String name, @Param("email")String email);
	
	//비밀번호 찾기
	public String findPw(@Param("id")String id,@Param("name")String name, @Param("email")String email);
	
	//비밀번호 변경
	public int updatePw(MemberVO vo);
	
	//회원가입
	public int commonWelcom(MemberVO vo);
	
	//가이드 회원가입 
	public int guideWelcom(MemberVO vo);
	//가이드의 결제
	public int guidePay(PaymentVO pvo);
	
	
	//가이드의 기간만료 후 결제
	public int addPay( @Param("pvo")PaymentVO pvo, @Param("pw")String pw, @Param("id")String id, @Param("gradeNo") int gradeNo);
	
	public int payDateUpdate(@Param("id")String id);
	

	//결제 만료 후 추가결제할때 가이드의 종류에 따라서 등급이 변경
	public int updateGradeNo( @Param("id")String id,  @Param("gradeNo")int gradeNo);
	
	//결제가 완료되면 상태가 정상으로 변경
	public int changeStatus(String id);
	
	//휴면상태에서 정상으로 변경되기
	public int statusNomal(@Param("id")String id, @Param("pw")String pw);
	public int statusNo(String id);
	
	//회원의 정보변경
	public int update(MemberVO vo);
	//가이드의 회원정보변경
	public int guideUpdate(MemberVO vo);
	
	public int updateHu();
	
	public int updatePay();
	
	//운영자의 정보변경
	public int updateAdmin(@Param("id") String id, @Param("status") String status);
	
	//일반회원탈퇴
	public int delete(@Param("id")String id, @Param("pw")String pw);
	
// 아작스 라인 ------------------------------------
	//비밀번호가 맞는지 체크
	//public int checkPw(@Param("pw")String pw, @Param("id")String id);
	//아이디 중복검사
	public int checkId(String id);
	//닉네임 중복검사
	public int checkNickName(String nickName);
	
	

}
