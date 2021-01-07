package com.goktech.olala.server.pojo.customer;

import java.util.Date;

public class CtmGoodsinfos {
    private String goodsId;

    @Override
    public String toString() {
        return "CtmGoodsinfos{" +
                "goodsId='" + goodsId + '\'' +
                ", goodsSn='" + goodsSn + '\'' +
                ", goodsName='" + goodsName + '\'' +
                ", keywords='" + keywords + '\'' +
                ", catyId='" + catyId + '\'' +
                ", catySn='" + catySn + '\'' +
                ", businessId='" + businessId + '\'' +
                ", effectiveDate=" + effectiveDate +
                ", expiryDays=" + expiryDays +
                ", goodsBrief='" + goodsBrief + '\'' +
                ", marketPrice=" + marketPrice +
                ", discount=" + discount +
                ", shopPrice=" + shopPrice +
                ", promotePrice=" + promotePrice +
                ", promoteStartDate=" + promoteStartDate +
                ", promoteEndDate=" + promoteEndDate +
                ", couponSn='" + couponSn + '\'' +
                ", isOnsale=" + isOnsale +
                ", shipFee=" + shipFee +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                ", goodsDesc='" + goodsDesc + '\'' +
                '}';
    }

    private String goodsSn;

    private String goodsName;

    private String keywords;

    private String catyId;

    private String catySn;

    private String businessId;

    private Date effectiveDate;

    private Integer expiryDays;

    private String goodsBrief;

    private Integer marketPrice;

    private Integer discount;

    private Integer shopPrice;

    private Integer promotePrice;

    private Date promoteStartDate;

    private Date promoteEndDate;

    private String couponSn;

    private Boolean isOnsale;

    private Integer shipFee;

    private Date createTime;

    private String createBy;

    private Date updateTime;

    private String updateBy;

    private String goodsDesc;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn == null ? null : goodsSn.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getCatyId() {
        return catyId;
    }

    public void setCatyId(String catyId) {
        this.catyId = catyId == null ? null : catyId.trim();
    }

    public String getCatySn() {
        return catySn;
    }

    public void setCatySn(String catySn) {
        this.catySn = catySn == null ? null : catySn.trim();
    }

    public String getBusinessId() {
        return businessId;
    }

    public void setBusinessId(String businessId) {
        this.businessId = businessId == null ? null : businessId.trim();
    }

    public Date getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Date effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    public Integer getExpiryDays() {
        return expiryDays;
    }

    public void setExpiryDays(Integer expiryDays) {
        this.expiryDays = expiryDays;
    }

    public String getGoodsBrief() {
        return goodsBrief;
    }

    public void setGoodsBrief(String goodsBrief) {
        this.goodsBrief = goodsBrief == null ? null : goodsBrief.trim();
    }

    public Integer getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Integer marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Integer shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Integer getPromotePrice() {
        return promotePrice;
    }

    public void setPromotePrice(Integer promotePrice) {
        this.promotePrice = promotePrice;
    }

    public Date getPromoteStartDate() {
        return promoteStartDate;
    }

    public void setPromoteStartDate(Date promoteStartDate) {
        this.promoteStartDate = promoteStartDate;
    }

    public Date getPromoteEndDate() {
        return promoteEndDate;
    }

    public void setPromoteEndDate(Date promoteEndDate) {
        this.promoteEndDate = promoteEndDate;
    }

    public String getCouponSn() {
        return couponSn;
    }

    public void setCouponSn(String couponSn) {
        this.couponSn = couponSn == null ? null : couponSn.trim();
    }

    public Boolean getIsOnsale() {
        return isOnsale;
    }

    public void setIsOnsale(Boolean isOnsale) {
        this.isOnsale = isOnsale;
    }

    public Integer getShipFee() {
        return shipFee;
    }

    public void setShipFee(Integer shipFee) {
        this.shipFee = shipFee;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public String getGoodsDesc() {
        return goodsDesc;
    }

    public void setGoodsDesc(String goodsDesc) {
        this.goodsDesc = goodsDesc == null ? null : goodsDesc.trim();
    }
}