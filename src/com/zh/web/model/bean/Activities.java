package com.zh.web.model.bean;

import java.util.Date;

import com.zh.core.model.IDataObject;

/**
 * 活动信息表
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class Activities extends IDataObject {
    /**
     * id
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.ID
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private Integer id;

    /**
     * 活动名称
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.NAME
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String name;

    /**
     * 活动描述
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.DESCRIPTION
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String description;

    /**
     * 预定时间
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.SCHEDULEDATE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String scheduleDate;

    /**
     * 集合时间
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.SETTIME
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String setTime;

    /**
     * 集合地点
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.SETPLACE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String setPlace;

    /**
     * 预计活动时间
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.SCHEDULETIME
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String scheduleTime;

    /**
     * 负责人
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.USERID
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private Integer userId;
    
    /**
     * 负责人姓名
     */
    private String userName;

    /**
     * 负责人电话
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.TELEPHONE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.CREATEDATE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_ACTIVITIES.UPDATEDATE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String updateDate;
    
    private String enabled;

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getSetTime() {
		return setTime;
	}

	public void setSetTime(String setTime) {
		this.setTime = setTime;
	}

	public String getSetPlace() {
		return setPlace;
	}

	public void setSetPlace(String setPlace) {
		this.setPlace = setPlace;
	}

	public String getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}