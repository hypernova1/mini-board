package com.bit.board.service;

import java.util.List;
import com.bit.board.model.MemberDto;
import com.bit.util.Criteria;

public interface MemberService {
	
	List<MemberDto> getMemberList(Criteria cri);
	void joinMember(MemberDto memberDto);
	void modifyMember(MemberDto memberDto);
	void deleteMember(int mid);
	Integer login(MemberDto memberDto);
	int idCheck(String mid);
    void encodePassword(MemberDto memberDto, String mpassword);
    MemberDto getMemberInfo(int mno);
    int getTotalCount(String keyword);

}
