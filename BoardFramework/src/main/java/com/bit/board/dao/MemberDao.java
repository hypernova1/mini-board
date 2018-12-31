package com.bit.board.dao;

import java.util.List;
import com.bit.board.model.MemberDto;
import com.bit.util.Criteria;

public interface MemberDao {
	
	List<MemberDto> getMemberList(Criteria cri);
	int getMemberNo(String mid);
	MemberDto getMemberInfo(int mno);
	void joinMember(MemberDto memberDto);
	int updateMember(MemberDto memberDto);
	void deleteMember(int mid);
	int login(MemberDto memberDto);
	int idCheck(String mid);
	String getPassword(String mid);
	int getTotalCount(String keyword);
	
}
