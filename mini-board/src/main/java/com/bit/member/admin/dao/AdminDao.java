package com.bit.member.admin.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MemberDto;

public interface AdminDao {

  List<MemberDto> getMemberList(Map<String, String> param);
  int deleteMember(int seq);
  int modifyMember(MemberDto memberDto);
  
}
