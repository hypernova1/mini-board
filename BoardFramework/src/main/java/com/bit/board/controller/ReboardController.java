package com.bit.board.controller;

import java.util.HashMap;
import java.util.List;
import javax.management.modelmbean.ModelMBean;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bit.board.model.MemberDto;
import com.bit.board.model.ReboardDto;
import com.bit.board.service.MemberService;
import com.bit.board.service.ReboardService;
import com.bit.common.service.CommonService;
import com.bit.util.PageNavigation;

@Controller
@RequestMapping("/reboard")
public class ReboardController {

  @Autowired
  private ReboardService reboardService;
  @Autowired
  private CommonService commonService;
  @Autowired
  private MemberService memberService;

  @GetMapping("list")
  public ModelAndView list(@RequestParam HashMap<String, String> param) {

    ModelAndView mav = new ModelAndView();
    List<ReboardDto> list = reboardService.listArticle(param);
    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();
    mav.setViewName("reboard/list");
    mav.addObject("articlelist", list);
    mav.addObject("navigator", navigation);
    return mav;
  }

  @GetMapping("write")
  public void write(@RequestParam HashMap<String, Object> param) {}

  @PostMapping("write")
  public String write(ReboardDto reboardDto, HashMap<String, Object> param, HttpSession session,
      Model model) {
    Integer mno = (Integer) session.getAttribute("mno");
    String mid = (String) session.getAttribute("mid");

    MemberDto member = memberService.getMemberInfo(mno);
    if (mno != null) {
      reboardDto.setId(mid);
      reboardDto.setEmail(mid);
      reboardDto.setName(member.getMname());
      int seq = reboardService.writeArticle(reboardDto);

      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "글 작성 실패");
      }
    }

    return "reboard/writeOk";
  }

  @GetMapping("view")
  public String view(@RequestParam int seq, HttpSession session, Model model) {
    ReboardDto reboardDto = reboardService.viewArticle(seq);
    model.addAttribute("article", reboardDto);
    
    return "reboard/view";
  }
  
  @GetMapping("modify")
  public String modify(int seq, Model model) {
    ReboardDto reboardDto = reboardService.viewArticle(seq);
    model.addAttribute("article", reboardDto);

    return "/reboard/modify";
  }
  
  @PostMapping("modify")
  public String modify(@RequestParam HashMap<String, Object> param, ReboardDto reboardDto, Model model) {
    reboardService.modifyArticle(reboardDto);
    
    model.addAttribute("seq", param.get("seq"));
    model.addAttribute("bcode", param.get("bcode"));
    model.addAttribute("page", param.get("page"));
    model.addAttribute("key", param.get("key"));
    model.addAttribute("word", param.get("word"));

    return "redirect:/reboard/view";
  }
  
  @PostMapping("delete")
  public String delete(@RequestParam HashMap<String, Object> param, Model model) {
    reboardService.deleteArticle((int) param.get("seq"));
    
    return null;
    
  }

  @GetMapping("reply")
  public String reply(@RequestParam int seq, Model model) {

    ReboardDto reboardDto = reboardService.viewArticle(seq);
    model.addAttribute("article", reboardDto);

    return "reboard/reply";
  }

  @PostMapping("reply")
  public String reply(HashMap<String, Object> param, ReboardDto reboardDto, HttpSession session,
      Model model) {
    Integer mno = (Integer) session.getAttribute("mno");
    if (mno != null) {
      // reboardDto.setId(memberDto.getId());
      // reboardDto.setName(memberDto.getName());
      // reboardDto.setEmail(memberDto.getEmail());
      int seq = reboardService.replyArticle(reboardDto);

      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "글 작성 실패");
      }
    } else {
      model.addAttribute("errorMsg", "회원 전용 게시판이다. 로그인 해라.");

    }

    return "reboard/writeOk";
  }
}
