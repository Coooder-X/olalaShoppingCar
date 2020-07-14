package com.goktech.olala.server.pojo.customer;

import java.util.Date;

public class CtmInfo {
    private String customerInfId;

    private String customerId;

    private String customerName;

    private String realName;

    private Boolean identyCardType;

    private String identyCardNo;

    private String userMobile;

    private String email;

    private Boolean gender;

    private String birthday;

    private Integer userPoint;

    private Date registerTime;

    private Boolean customerLevel;

    private Integer userBalance;

    private Date modifiedTime;

    public String getCustomerInfId() {
        return customerInfId;
    }

    public void setCustomerInfId(String customerInfId) {
        this.customerInfId = customerInfId == null ? null : customerInfId.trim();
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public Boolean getIdentyCardType() {
        return identyCardType;
    }

    public void setIdentyCardType(Boolean identyCardType) {
        this.identyCardType = identyCardType;
    }

    public String getIdentyCardNo() {
        return identyCardNo;
    }

    public void setIdentyCardNo(String identyCardNo) {
        this.identyCardNo = identyCardNo == null ? null : identyCardNo.trim();
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile == null ? null : userMobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public Integer getUserPoint() {
        return userPoint;
    }

    public void setUserPoint(Integer userPoint) {
        this.userPoint = userPoint;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Boolean getCustomerLevel() {
        return customerLevel;
    }

    public void setCustomerLevel(Boolean customerLevel) {
        this.customerLevel = customerLevel;
    }

    public Integer getUserBalance() {
        return userBalance;
    }

    public void setUserBalance(Integer userBalance) {
        this.userBalance = userBalance;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}