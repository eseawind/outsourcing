package com.zh.web.model.bean;

import java.math.BigDecimal;
import java.util.Date;

public class PhysicalExam {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.ID
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.NAME
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.ADDRESS
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String address;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.TELEPHONE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.REMARKS
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String remarks;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.TYPE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private String type;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.SCHEDULEDATE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private Date scheduleDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.RECEIVEDATE
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private Date receiveDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column T_PHYSICALEXAMINATION.TECHNOLOGICALPROCESSID
     *
     * @mbggenerated Mon Oct 20 16:39:07 CST 2014
     */
    private BigDecimal technologicalProcessId;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public BigDecimal getTechnologicalProcessId() {
		return technologicalProcessId;
	}

	public void setTechnologicalProcessId(BigDecimal technologicalProcessId) {
		this.technologicalProcessId = technologicalProcessId;
	}
}