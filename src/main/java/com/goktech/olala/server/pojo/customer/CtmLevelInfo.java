package com.goktech.olala.server.pojo.customer;

public class CtmLevelInfo {
    private Integer customerLevelId;

    private String levelName;

    private Integer minPoint;

    private Integer maxPoint;

    public Integer getCustomerLevelId() {
        return customerLevelId;
    }

    public void setCustomerLevelId(Integer customerLevelId) {
        this.customerLevelId = customerLevelId;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName == null ? null : levelName.trim();
    }

    public Integer getMinPoint() {
        return minPoint;
    }

    public void setMinPoint(Integer minPoint) {
        this.minPoint = minPoint;
    }

    public Integer getMaxPoint() {
        return maxPoint;
    }

    public void setMaxPoint(Integer maxPoint) {
        this.maxPoint = maxPoint;
    }
}