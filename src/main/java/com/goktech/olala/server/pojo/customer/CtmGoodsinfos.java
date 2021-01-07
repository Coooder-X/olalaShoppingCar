package com.goktech.olala.server.pojo.customer;

import java.util.Date;
import java.util.Random;

public class CtmGoodsinfos {
    private Integer categoryId;

    private String categoryName;

    private String parentId;

    private String keywords;

    @Override
    public String toString() {
        return "CtmGoodsinfos{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", parentId='" + parentId + '\'' +
                ", keywords='" + keywords + '\'' +
                ", catyDesc='" + catyDesc + '\'' +
                ", sortOrl=" + sortOrl +
                ", isShowInNav=" + isShowInNav +
                ", grade=" + grade +
                ", filterAttr='" + filterAttr + '\'' +
                ", isShow=" + isShow +
                ", isEnabled=" + isEnabled +
                ", createTime=" + createTime +
                ", createBy='" + createBy + '\'' +
                ", updateTime=" + updateTime +
                ", updateBy='" + updateBy + '\'' +
                '}';
    }

    private String catyDesc;

    private Integer sortOrl;

    private Boolean isShowInNav;

    private Byte grade;

    private String filterAttr;

    private Boolean isShow;

    private Boolean isEnabled;

    private Date createTime;

    private String createBy;

    private Date updateTime;

    private String updateBy;

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getCatyDesc() {
        return catyDesc;
    }

    public void setCatyDesc(String catyDesc) {
        this.catyDesc = catyDesc == null ? null : catyDesc.trim();
    }

    public Integer getSortOrl() {
        return sortOrl;
    }

    public void setSortOrl(Integer sortOrl) {
        this.sortOrl = sortOrl;
    }

    public Boolean getIsShowInNav() {
        return isShowInNav;
    }

    public void setIsShowInNav(Boolean isShowInNav) {
        this.isShowInNav = isShowInNav;
    }

    public Byte getGrade() {
        return grade;
    }

    public void setGrade(Byte grade) {
        this.grade = grade;
    }

    public String getFilterAttr() {
        return filterAttr;
    }

    public void setFilterAttr(String filterAttr) {
        this.filterAttr = filterAttr == null ? null : filterAttr.trim();
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public Boolean getIsEnabled() {
        return isEnabled;
    }

    public void setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
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

    public String getRandomPrice(){
        Random r = new Random();
        Integer ran1 = r.nextInt(2000) + 3500;
        ran1 -= ran1 % 10;
        return ran1.toString();
    }
    public String getRandomSell(){
        Random r = new Random();
        Integer ran1 = r.nextInt(200) + 3500;
        return ran1.toString();
    }
}