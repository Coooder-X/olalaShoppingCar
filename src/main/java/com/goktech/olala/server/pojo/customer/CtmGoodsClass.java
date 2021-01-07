package com.goktech.olala.server.pojo.customer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class CtmGoodsClass {
    Integer goodsID;
    String goodsName;

    public Integer getGoodsID() {
        return goodsID;
    }

    public CtmGoodsClass() {
    }

    @Override
    public String toString() {
        return "CtmGoodsClass{" +
                "goodsID=" + goodsID +
                ", goodsName='" + goodsName + '\'' +
                '}';
    }

    public CtmGoodsClass(Integer goodsID, String goodsName) {
        this.goodsID = goodsID;
        this.goodsName = goodsName;
    }

    public void setGoodsID(Integer goodsID) {
        this.goodsID = goodsID;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }
}
