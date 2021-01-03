package com.goktech.olala.server.pojo.customer;

import com.oracle.webservices.internal.api.databinding.DatabindingMode;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CtmLogin {
    private String customerId;

    private String loginName;

    private String password;

    private Boolean userStatus;

    private Date modifiedTime;

    public CtmLogin(String userName, String pwd) {
        loginName = userName;
        password = pwd;
    }

    public CtmLogin(String customerId, String loginName, String password, boolean userStatus, Date modifiedTime){
        this.customerId = customerId;
        this.loginName = loginName;
        this.password = password;
        this.userStatus = userStatus;
        this.modifiedTime = modifiedTime;
    }

//    public String getCustomerId() {
//        return customerId;
//    }
//
//    public void setCustomerId(String customerId) {
//        this.customerId = customerId == null ? null : customerId.trim();
//    }
//
//    public String getLoginName() {
//        return loginName;
//    }
//
//    public void setLoginName(String loginName) {
//        this.loginName = loginName == null ? null : loginName.trim();
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password == null ? null : password.trim();
//    }
//
//    public Boolean getUserStatus() {
//        return userStatus;
//    }
//
//    public void setUserStatus(Boolean userStatus) {
//        this.userStatus = userStatus;
//    }
//
//    public Date getModifiedTime() {
//        return modifiedTime;
//    }
//
//    public void setModifiedTime(Date modifiedTime) {
//        this.modifiedTime = modifiedTime;
//    }

    @Override
    public String toString() {
        return customerId + " " + loginName + " " + password + " " + userStatus + " " + modifiedTime;
    }
}