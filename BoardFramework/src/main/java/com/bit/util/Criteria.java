package com.bit.util;

public class Criteria {

  private int page;
  private int perPageNum;
  private String keyword;

  public Criteria() {
    this.page = 1;
    this.perPageNum = 10;
  }

  public void setPage(int page) {
    if (page <= 0) {
      return;
    } else {
      this.page = page;
    }
  }

  public void setPerPageNum(int perPageNum) {
    if (perPageNum < 10 || perPageNum > 50) {
      return;
    } else {
      this.perPageNum = perPageNum;
    }
  }

  public String getKeyword() {
    return keyword;
  }

  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }

  public int getPage() {
    return page;
  }

  public int getPerPageNum() {
    return perPageNum;
  }

}
