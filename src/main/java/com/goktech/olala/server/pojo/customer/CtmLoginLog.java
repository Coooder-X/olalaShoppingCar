package com.goktech.olala.server.pojo.customer;

import java.util.Date;

public class CtmLoginLog {
    private Long loginId;

    private String customerId;

    private Date loginTime;

    private String loginIp;

    private Boolean loginType;

    public Long getLoginId() {
        return loginId;
    }

    public void setLoginId(Long loginId) {
        this.loginId = loginId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

    public Boolean getLoginType() {
        return loginType;
    }

    public void setLoginType(Boolean loginType) {
        this.loginType = loginType;
    }
}