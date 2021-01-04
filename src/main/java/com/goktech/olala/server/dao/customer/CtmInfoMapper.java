package com.goktech.olala.server.dao.customer;

import com.goktech.olala.core.req.CtmInfoReq;
import com.goktech.olala.server.dao.sql.CtmInfoSql;
import com.goktech.olala.server.pojo.customer.CtmInfo;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface CtmInfoMapper {
    CtmInfo queryCmtInfoForReg(String userName);

    CtmInfo queryCtmInfoByCtmID(String customerId);

    int insertCtmInfo(CtmInfo ctmInfo);
    /**
     * 根据客户信息主键删除
     *
     * @param customerInfId
     * @return
     */
    int deleteByPrimaryKey(String customerInfId);

    /**
     * 添加客户信息
     *
     * @param record
     * @return
     */
    int insert(CtmInfo record);

    /**
     * 根据客户信息主键ID查询
     *
     * @param customerInfId
     * @return
     */
    CtmInfo selectByPrimaryKey(String customerInfId);

    /**
     * 查询所有有效客户信息
     *
     * @return
     */
    List<CtmInfo> selectAll();

    /**
     * 根据客户信息主键ID更新客户信息
     *
     * @param record
     * @return
     */
    int updateByPrimaryKey(CtmInfo record);

    /**
     * 绑定查询条件查询客户信息
     *
     * @param record
     * @return
     */

    @SelectProvider(type= CtmInfoSql.class, method = "queryCtmInfoByParam")
    List<CtmInfo> selectByExample(CtmInfo record);

    @Update("UPDATE C_CUSTOMER_INFO SET CUSTOMER_STATUS = ${record.customerStatus} WHERE CUSTOMER_ID = '${record.customerId}'")
    int updateStatus(CtmInfo record);
}