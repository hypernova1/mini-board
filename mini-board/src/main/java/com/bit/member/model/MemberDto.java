package com.bit.member.model;

public class MemberDto {
  private int mno;
  private String mid;
  private String mname;
  private String mpassword;
  private String gender;
  private String birthday;
  private String phone;
  private String zipcode;
  private String address;
  private String regdate;
  
  public String getRegdate() {
    return regdate;
  }
  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
  
  public int getMno() {
    return mno;
  }
  public void setMno(int mno) {
    this.mno = mno;
  }
  public String getMid() {
    return mid;
  }
  public void setMid(String mid) {
    this.mid = mid;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getMpassword() {
    return mpassword;
  }
  public void setMpassword(String mpassword) {
    this.mpassword = mpassword;
  }
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getBirthday() {
    return birthday;
  }
  public void setBirthday(String birthday) {
    this.birthday = birthday;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  
}
