package com.bit.member.admin.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bit.member.admin.service.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
  
  @Autowired
  private AdminService adminService;
  
  //TODO: 멤버 등록
  @PostMapping("/")
  public @ResponseBody ResponseEntity<Boolean> addUser(){
    
    return new ResponseEntity<Boolean>(true, HttpStatus.OK);
  }
  
  //TODO: 멤버 삭제
  @DeleteMapping("/")
  public @ResponseBody ResponseEntity<Boolean> deleteUser(int seq){
    
    return new ResponseEntity<>(true, HttpStatus.OK);
  }
  
  //TODO: 멤버리스트 뿌리기
  @GetMapping("list")
  public String list(Map<String, String> param) {
    
    return "admin/list";
  }
  
}
