package com.goktech.olala.server.dao.sys;

import com.goktech.olala.server.pojo.sys.SysDict;
import java.util.List;

public interface SysDictDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dict
     *
     * @mbg.generated Tue Jul 07 16:57:55 CST 2020
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dict
     *
     * @mbg.generated Tue Jul 07 16:57:55 CST 2020
     */
    int insert(SysDict record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dict
     *
     * @mbg.generated Tue Jul 07 16:57:55 CST 2020
     */
    SysDict selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dict
     *
     * @mbg.generated Tue Jul 07 16:57:55 CST 2020
     */
    List<SysDict> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_dict
     *
     * @mbg.generated Tue Jul 07 16:57:55 CST 2020
     */
    int updateByPrimaryKey(SysDict record);
}