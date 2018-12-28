package com.bit.member.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MemberDto;

public interface MemberDao {
	
	List<MemberDto> getMemberList(Map<String, String> param);
	int getMemberNo(String mid);
	MemberDto getMemberInfo(int mno);
	void joinMember(MemberDto memberDto);
	void updateMember(MemberDto memberDto);
	void deleteMember(int mid);
	int login(MemberDto memberDto);
	int idCheck(String mid);
	String getPassword(String mid);
	
}
