package com.bit.member.admin.service;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MemberDto;

public interface AdminService {
  
  List<MemberDto> getMemberList(Map<String, String> param);
  int deleteMember(int seq);
  int modifyMember(MemberDto memberDto);
  
}
