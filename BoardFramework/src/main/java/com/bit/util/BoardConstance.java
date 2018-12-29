package com.bit.util;

public enum BoardConstance {
  LIST_CNT(20), PAGE_CNT(10), PICTURE_CNT(12);
  
  private int value;
  private BoardConstance(int value) {
    this.value = value;
  }
  public int getValue() {
    return value;
  }
  
}
