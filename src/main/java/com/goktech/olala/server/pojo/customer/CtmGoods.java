package com.goktech.olala.server.pojo.customer;

import java.util.Date;

public class CtmGoods {
    private Integer wpId;

    private String goodsId;

    private Integer whId;

    private Integer currentCnt;

    private Integer lockCnt;

    private Integer intransitCnt;

    private Integer averageCost;

    private Date modifiedTime;

    public Integer getWpId() {
        return wpId;
    }

    public void setWpId(Integer wpId) {
        this.wpId = wpId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public Integer getWhId() {
        return whId;
    }

    public void setWhId(Integer whId) {
        this.whId = whId;
    }

    public Integer getCurrentCnt() {
        return currentCnt;
    }

    public void setCurrentCnt(Integer currentCnt) {
        this.currentCnt = currentCnt;
    }

    public Integer getLockCnt() {
        return lockCnt;
    }

    public void setLockCnt(Integer lockCnt) {
        this.lockCnt = lockCnt;
    }

    public Integer getIntransitCnt() {
        return intransitCnt;
    }

    public void setIntransitCnt(Integer intransitCnt) {
        this.intransitCnt = intransitCnt;
    }

    public Integer getAverageCost() {
        return averageCost;
    }

    public void setAverageCost(Integer averageCost) {
        this.averageCost = averageCost;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}