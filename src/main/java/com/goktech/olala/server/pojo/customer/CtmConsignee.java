package com.goktech.olala.server.pojo.customer;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
public class CtmConsignee {
    private Integer customerAddrId;

    private String customerId;

    private String zip;

    private String province;

    private String city;

    private String district;

    private String address;

    private Boolean isDefault;

    private Date modifiedTime;

    private String userName;

    private String phone;

    public String getScPhone(){
        return phone.substring(0, 3) + "****" + phone.substring(7, phone.length());
    }
    @Override
    public String toString() {
        return "CtmConsignee{" +
                "customerAddrId=" + customerAddrId +
                ", customerId='" + customerId + '\'' +
                ", zip='" + zip + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", address='" + address + '\'' +
                ", isDefault=" + isDefault +
                ", modifiedTime=" + modifiedTime +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public CtmConsignee() {
        customerAddrId = null;
        customerId = zip = province = city = district = address = userName = phone = null;
        isDefault = false;
        modifiedTime = new Date();
    }

    public Integer getCustomerAddrId() {
        return customerAddrId;
    }

    public void setCustomerAddrId(Integer customerAddrId) {
        this.customerAddrId = customerAddrId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip == null ? null : zip.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}