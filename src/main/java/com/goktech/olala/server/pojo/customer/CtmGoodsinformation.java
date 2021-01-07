package com.goktech.olala.server.pojo.customer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CtmGoodsinformation {
    private String goodName;
    private long goodID;
    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public long getGoodID() {
        return goodID;
    }

    public void setGoodID(long goodID) {
        this.goodID = goodID;
    }
}
