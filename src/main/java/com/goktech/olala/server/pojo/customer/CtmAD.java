package com.goktech.olala.server.pojo.customer;

public class CtmAD {
    private String adname;

    private Integer times;

    private Integer price;

    private Integer adlevel;

    private Double cpc;

    private Double cpm;

    private Double ctr;

    private Double roi;

    private String searchword;

    private Double actionCost;

    private String adtime;

    private String adtype;

    private String adbusiness;

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname == null ? null : adname.trim();
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getAdlevel() {
        return adlevel;
    }

    public void setAdlevel(Integer adlevel) {
        this.adlevel = adlevel;
    }

    public Double getCpc() {
        return cpc;
    }

    public void setCpc(Double cpc) {
        this.cpc = cpc;
    }

    public Double getCpm() {
        return cpm;
    }

    public void setCpm(Double cpm) {
        this.cpm = cpm;
    }

    public Double getCtr() {
        return ctr;
    }

    public void setCtr(Double ctr) {
        this.ctr = ctr;
    }

    public Double getRoi() {
        return roi;
    }

    public void setRoi(Double roi) {
        this.roi = roi;
    }

    public String getSearchword() {
        return searchword;
    }

    public void setSearchword(String searchword) {
        this.searchword = searchword == null ? null : searchword.trim();
    }

    public Double getActionCost() {
        return actionCost;
    }

    public void setActionCost(Double actionCost) {
        this.actionCost = actionCost;
    }

    public String getAdtime() {
        return adtime;
    }

    public void setAdtime(String adtime) {
        this.adtime = adtime == null ? null : adtime.trim();
    }

    public String getAdtype() {
        return adtype;
    }

    public void setAdtype(String adtype) {
        this.adtype = adtype == null ? null : adtype.trim();
    }

    public String getAdbusiness() {
        return adbusiness;
    }

    public void setAdbusiness(String adbusiness) {
        this.adbusiness = adbusiness == null ? null : adbusiness.trim();
    }
}