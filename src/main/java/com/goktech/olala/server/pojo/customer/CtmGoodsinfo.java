package com.goktech.olala.server.pojo.customer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CtmGoodsinfo {
    private String goodName;
    private String goodID;
//    private int price;
//    private int number;
//    private int discout = 1;
//    private int sum;

//    public CtmGoodsinfo(String name, String id) {
//        goodName = name;
//        goodID = id;
//    }

    public String getGoodName() {
        return goodName;
    }
    public int setSum(int num){
//        this.number = num;
//        return price * number * discout;
        return 0;
    }
    public int getSum() {
        return 0;//sum;
    }

    public String getGoodID() {
        return goodID;
    }

    public void setGoodID(String goodID) {
        this.goodID = goodID;
    }

    public int getPrice() {
//        return price;
        return 0;
    }

    public void setPrice(int price) {
//        this.price = price;
    }

    public int getNumber() {
//        return number;
        return 0;
    }

    public void setNumber(int number) {
//        this.number = number;
    }

    public int getDiscout() {
//        return discout;
        return 0;
    }

    public void setDiscout(int discout) {
//        this.discout = discout;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
