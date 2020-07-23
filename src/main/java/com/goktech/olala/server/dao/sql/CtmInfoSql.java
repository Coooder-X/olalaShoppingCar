package com.goktech.olala.server.dao.sql;

import com.goktech.olala.server.pojo.customer.CtmInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;

/**
 * 客户信息操作动态SQL
 *
 * @author zhaoy
 * @date 2020-07-23
 */
public class CtmInfoSql {
    private final String TBL_ORDER = "C_CUSTOMER_INFO";

    /**
     * 根据查询条件查询客户信息
     *
     * @param record
     * @return
     */
    public String queryCtmInfoByParam(CtmInfo record){
        SQL sql = new SQL().SELECT("*").FROM(TBL_ORDER);
        if(null == record){
            return sql.toString();
        }
        if(StringUtils.isNotBlank(record.getCustomerInfId())){
            sql.WHERE("CUSTOMER_INF_ID = #{customerInfId}");
        }
        if(StringUtils.isNotBlank(record.getCustomerId())){
            sql.WHERE("CUSTOMER_ID = #{customerId}");
        }
        if(StringUtils.isNotBlank(record.getCustomerName())){
            sql.WHERE("CUSTOMER_NAME = #{customerName}");
        }
        if(StringUtils.isNotBlank(record.getIdentyCardNo())){
            sql.WHERE("IDENTY_CARD_NO = #{identyCardNo}");
        }
        if(StringUtils.isNotBlank(record.getUserMobile())){
            sql.WHERE("USER_MOBILE = #{userMobile}");
        }
        if(StringUtils.isNotBlank(record.getEmail())){
            sql.WHERE("EMAIL = #{email}");
        }
        if(null != record.getGender()){
            sql.WHERE("GENDER = #{gender}");
        }
        return sql.toString();
    }

}
