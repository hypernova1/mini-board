package com.bit.board.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.board.model.MemberDto;
import com.bit.board.service.MemberService;

@Controller
public class MemberController {
  @Autowired
  private MemberService memberService;
  
  @GetMapping("join")
  public String joinForm() {
    return "member/joinForm";
  }
  
  @GetMapping("login")
  public String loginForm() {
    return "member/loginForm";
  }
  
  @GetMapping("mypage")
  public String myPage(Model model, HttpSession session) {
    MemberDto member = memberService.getMemberInfo((int) session.getAttribute("mno"));
    model.addAttribute("member", member);
    return "/member/mypage";
  }
  
  @GetMapping("modify")
  public String modifyPage(Model model, HttpSession session) {
    MemberDto member = memberService.getMemberInfo((int) session.getAttribute("mno"));
    model.addAttribute("member", member);
    return "/member/modifyForm";
  }
  
  @PutMapping("modify")
  public @ResponseBody ResponseEntity<Boolean> modify(@RequestBody MemberDto memberDto, HttpSession session){
    
    memberDto.setMno((Integer) session.getAttribute("mno"));
    memberService.modifyMember(memberDto);
    
    return new ResponseEntity<>(true, HttpStatus.OK);
    
  }
}
