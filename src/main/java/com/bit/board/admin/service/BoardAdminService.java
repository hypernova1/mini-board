package com.bit.board.admin.service;

import java.util.List;
import java.util.Locale.Category;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.model.BoardTypeDto;
import com.bit.board.admin.model.CategoryDto;

public interface BoardAdminService {

  List<BoardListDto> getBoardMenu();

  List<Category> getCategory();

  void makeCategory(CategoryDto catogory);

  List<BoardTypeDto> getBoardType();

  void makeBoard(BoardListDto boardList);

}
