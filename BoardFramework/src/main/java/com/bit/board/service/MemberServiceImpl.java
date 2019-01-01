package com.bit.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.bit.board.dao.MemberDao;
import com.bit.board.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

  @Autowired
  private SqlSession sqlSession;
  @Autowired
  private BCryptPasswordEncoder bcryptPasswordEncoder;

  @Override
  public List<MemberDto> getMemberList(Map<String, String> param) {
    return sqlSession.getMapper(MemberDao.class).getMemberList(param);
  }

  @Override
  public void joinMember(MemberDto memberDto) {
    sqlSession.getMapper(MemberDao.class).joinMember(memberDto);

  }

  @Override
  public void modifyMember(MemberDto memberDto) {
    System.out.println(sqlSession.getMapper(MemberDao.class).updateMember(memberDto));
  }

  @Override
  public void deleteMember(int mid) {
    // TODO Auto-generated method stub
  }

  @Override
  public Integer login(MemberDto memberDto) {
    String oldPwd = sqlSession.getMapper(MemberDao.class).getPassword(memberDto.getMid());
    
    if(oldPwd == null) return null; //비밀번호가 없을시 (정보가 없을시)
    
    boolean result = bcryptPasswordEncoder.matches(memberDto.getMpassword(), oldPwd);
    if(!result) return null; // 비밀번호가 맞지 않을시

    Integer mno = sqlSession.getMapper(MemberDao.class).getMemberNo(memberDto.getMid());
    
    return mno;
  }

  @Override
  public int idCheck(String mid) {
    return sqlSession.getMapper(MemberDao.class).idCheck(mid);
  }

  @Override
  public void encodePassword(MemberDto memberDto, String mpassword) {
    String pwd =  bcryptPasswordEncoder.encode(mpassword);
    memberDto.setMpassword(pwd);
  }

  @Override
  public MemberDto getMemberInfo(int mno) {
    return sqlSession.getMapper(MemberDao.class).getMemberInfo(mno);
  }

  @Override
  public int getTotalCount(String keyword) {
      return sqlSession.getMapper(MemberDao.class).getTotalCount(keyword);
  }
  



}
