package com.goktech.olala.core.resp;

public class RespUserVo {

    private String userId;
    private String userName;
    private String password;
    private String realName;

    private Integer respCode;
    private String respMge;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getRespCode() {
        return respCode;
    }

    public void setRespCode(Integer respCode) {
        this.respCode = respCode;
    }

    public String getRespMge() {
        return respMge;
    }

    public void setRespMge(String respMge) {
        this.respMge = respMge;
    }
}
