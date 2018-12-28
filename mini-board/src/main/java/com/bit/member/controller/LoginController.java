package com.bit.member.controller;

import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.bit.member.model.MemberDto;
import com.bit.member.service.MemberService;

@RestController
@RequestMapping("member")
public class LoginController {

  @Autowired
  private MemberService memberService;
  
  @PostMapping("idCheck")
  public ResponseEntity<Integer> check(@RequestBody String id) {
    JSONObject obj = new JSONObject(id);
    int result = memberService.idCheck(obj.getString("mid"));
    
    return new ResponseEntity<>(result, HttpStatus.OK);
  }
  
  @PostMapping("join")
  public ResponseEntity<Boolean> join(@RequestBody MemberDto member) {
    memberService.encodePassword(member, member.getMpassword());
    memberService.joinMember(member);
    
    return new ResponseEntity<Boolean>(true, HttpStatus.OK);
  }
  
  @PostMapping("login")
  public ResponseEntity<Boolean> login(MemberDto memberDto, HttpSession session){
    
    boolean result = false;
    
    Integer mno = memberService.login(memberDto);
    if(mno != null) {
      session.setAttribute("loginUser", mno);
      result = true;
    }
    
    return new ResponseEntity<>(result, HttpStatus.OK);
  }
  
  @PostMapping("logout")
  public ResponseEntity<Boolean> logout(HttpSession session){
    session.invalidate();
    
    return new ResponseEntity<>(true, HttpStatus.OK);
  }
  
  @PutMapping("modify")
  public ResponseEntity<Boolean> modify(@RequestBody MemberDto memberDto, HttpSession session){
    int mno = (int) session.getAttribute("loginUser");
    
    memberDto.setMno(mno);
    memberService.modifyMember(memberDto);
    
    return new ResponseEntity<>(true, HttpStatus.OK);
  }
  
}
