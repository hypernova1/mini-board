package com.bit.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.bit.member.model.MemberDto;
import com.bit.member.service.MemberService;

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
    MemberDto member = memberService.getMemberInfo((int) session.getAttribute("loginUser"));
    model.addAttribute("member", member);
    return "/member/mypage";
  }
  
  @GetMapping("modify")
  public String modifyPage(Model model, HttpSession session) {
    MemberDto member = memberService.getMemberInfo((int) session.getAttribute("loginUser"));
    model.addAttribute("member", member);
    return "/member/modifyForm";
  }
  
}
