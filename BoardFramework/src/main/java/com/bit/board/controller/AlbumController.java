package com.bit.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.bit.board.model.AlbumDto;
import com.bit.board.model.MemberDto;
import com.bit.board.service.AlbumService;
import com.bit.common.service.CommonService;
import com.bit.util.PageNavigation;

@Controller
@RestController
@RequestMapping("/album")
public class AlbumController {

  @Autowired
  private AlbumService albumService;
  @Autowired
  private CommonService commonService;
  @Autowired
  private ServletContext servletContext; // 어플리케이션 영역

  @RequestMapping("list")
  public ModelAndView list(@RequestParam HashMap<String, String> param) {
    ModelAndView mav = new ModelAndView();
    List<AlbumDto> list = albumService.listArticle(param);
    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();

    mav.setViewName("album/list");
    mav.addObject("articlelist", list);
    mav.addObject("navigator", navigation);
    return mav;
  }

  @GetMapping("write")
  public void write(@RequestParam HashMap<String, Object> param) {}

  @PostMapping("write")
  public String write(AlbumDto albumDto, @RequestParam("picture") MultipartFile multipartFile,
      HttpSession session, Model model) {
    Integer mno = (Integer) session.getAttribute("loginUser");
    
    if (multipartFile != null && !multipartFile.isEmpty()) {
      String oPicture = multipartFile.getOriginalFilename();
      String realPath = servletContext.getRealPath("/img/upload/album");
      DateFormat df = new SimpleDateFormat("yyMMdd");
      String saveFolder = df.format(new Date());
      String fullSaveFolder = realPath + File.separator + saveFolder;
      File dir = new File(fullSaveFolder);

      if (!dir.exists())
        dir.mkdirs();

      String savePicture =
          UUID.randomUUID().toString() + oPicture.substring(oPicture.lastIndexOf("."));

      File file = new File(fullSaveFolder, savePicture);

      try {
        multipartFile.transferTo(file);
      } catch (IllegalStateException | IOException e) {
        e.printStackTrace();
      }
      albumDto.setOriginPicture(oPicture);
      albumDto.setSavePicture(savePicture);
      albumDto.setSaveFolder(saveFolder);
    }

    int seq = albumService.writeArticle(albumDto);

    if (seq != 0) {
      model.addAttribute("wseq", seq);
    } else {
      model.addAttribute("errorMsg", "글 작성 실패");
    }

    return "album/writeOk";
  }
}
