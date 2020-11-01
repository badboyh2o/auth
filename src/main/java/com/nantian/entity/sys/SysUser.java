package com.nantian.entity.sys;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
    /**
     * ID主键
     */
    @JSONField(serializeUsing = ToStringSerializer.class)
    private Long id;

    /**
     * 帐号
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 用户名称
     */
    private String name;

    /**
     * 所属机构ID
     */
    private String orgNo;

    /**
     * 手机号--11位，加区位
     */
    private String phoneNo;

    /**
     * 固定号码--三个区位，加分隔线，加7位坐机号
     */
    private String landline;

    /**
     * 身份证
     */
    private String idCard;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 地址
     */
    private String adress;

    /**
     * 邮政编码
     */
    private String zipCode;

    /**
     * 状态 0废止；1可用；2临时锁定；3：永久锁定
     */
    private String status;

    /**
     * 扩展字段1
     */
    private String extend1;

    /**
     * 扩展字段2
     */
    private String extend2;

    /**
     * 本次登录时间
     */
    private String loginTime;

    /**
     * 上一次登录时间
     */
    private Date lastLoginTime;

    /**
     * 当天登录错误次数
     */
    private Integer errorCount;

    /**
     * 创建时间 审计字段
     */
    private Date creationTime;

    /**
     * 更新时间 审计字段
     */
    private Date updateTime;

    /**
     * 性别，默认0；0保密；1男；2女
     */
    private String sex;

    /**
     * 序列化版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 获取 ID主键
     * @return ID主键
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置 ID主键
     * @param id ID主键
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取 帐号
     * @return 帐号
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置 帐号
     * @param username 帐号
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取 密码
     * @return 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置 密码
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取 用户名称
     * @return 用户名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置 用户名称
     * @param name 用户名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取 所属机构ID
     * @return 所属机构ID
     */
    public String getOrgNo() {
        return orgNo;
    }

    /**
     * 设置 所属机构ID
     * @param orgNo 所属机构ID
     */
    public void setOrgNo(String orgNo) {
        this.orgNo = orgNo;
    }

    /**
     * 获取 手机号--11位，加区位
     * @return 手机号--11位，加区位
     */
    public String getPhoneNo() {
        return phoneNo;
    }

    /**
     * 设置 手机号--11位，加区位
     * @param phoneNo 手机号--11位，加区位
     */
    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    /**
     * 获取 固定号码--三个区位，加分隔线，加7位坐机号
     * @return 固定号码--三个区位，加分隔线，加7位坐机号
     */
    public String getLandline() {
        return landline;
    }

    /**
     * 设置 固定号码--三个区位，加分隔线，加7位坐机号
     * @param landline 固定号码--三个区位，加分隔线，加7位坐机号
     */
    public void setLandline(String landline) {
        this.landline = landline;
    }

    /**
     * 获取 身份证
     * @return 身份证
     */
    public String getIdCard() {
        return idCard;
    }

    /**
     * 设置 身份证
     * @param idCard 身份证
     */
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    /**
     * 获取 邮箱
     * @return 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置 邮箱
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取 地址
     * @return 地址
     */
    public String getAdress() {
        return adress;
    }

    /**
     * 设置 地址
     * @param adress 地址
     */
    public void setAdress(String adress) {
        this.adress = adress;
    }

    /**
     * 获取 邮政编码
     * @return 邮政编码
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * 设置 邮政编码
     * @param zipCode 邮政编码
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * 获取 状态 0废止；1可用；2临时锁定；3：永久锁定
     * @return 状态 0废止；1可用；2临时锁定；3：永久锁定
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置 状态 0废止；1可用；2临时锁定；3：永久锁定
     * @param status 状态 0废止；1可用；2临时锁定；3：永久锁定
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 获取 扩展字段1
     * @return 扩展字段1
     */
    public String getExtend1() {
        return extend1;
    }

    /**
     * 设置 扩展字段1
     * @param extend1 扩展字段1
     */
    public void setExtend1(String extend1) {
        this.extend1 = extend1;
    }

    /**
     * 获取 扩展字段2
     * @return 扩展字段2
     */
    public String getExtend2() {
        return extend2;
    }

    /**
     * 设置 扩展字段2
     * @param extend2 扩展字段2
     */
    public void setExtend2(String extend2) {
        this.extend2 = extend2;
    }

    /**
     * 获取 本次登录时间
     * @return 本次登录时间
     */
    public String getLoginTime() {
        return loginTime;
    }

    /**
     * 设置 本次登录时间
     * @param loginTime 本次登录时间
     */
    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    /**
     * 获取 上一次登录时间
     * @return 上一次登录时间
     */
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    /**
     * 设置 上一次登录时间
     * @param lastLoginTime 上一次登录时间
     */
    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    /**
     * 获取 当天登录错误次数
     * @return 当天登录错误次数
     */
    public Integer getErrorCount() {
        return errorCount;
    }

    /**
     * 设置 当天登录错误次数
     * @param errorCount 当天登录错误次数
     */
    public void setErrorCount(Integer errorCount) {
        this.errorCount = errorCount;
    }

    /**
     * 获取 创建时间 审计字段
     * @return 创建时间 审计字段
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * 设置 创建时间 审计字段
     * @param creationTime 创建时间 审计字段
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }

    /**
     * 获取 更新时间 审计字段
     * @return 更新时间 审计字段
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置 更新时间 审计字段
     * @param updateTime 更新时间 审计字段
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取 性别，默认0；0保密；1男；2女
     * @return 性别，默认0；0保密；1男；2女
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置 性别，默认0；0保密；1男；2女
     * @param sex 性别，默认0；0保密；1男；2女
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", username=").append(username);
        sb.append(", password=").append(password);
        sb.append(", name=").append(name);
        sb.append(", orgNo=").append(orgNo);
        sb.append(", phoneNo=").append(phoneNo);
        sb.append(", landline=").append(landline);
        sb.append(", idCard=").append(idCard);
        sb.append(", email=").append(email);
        sb.append(", adress=").append(adress);
        sb.append(", zipCode=").append(zipCode);
        sb.append(", status=").append(status);
        sb.append(", extend1=").append(extend1);
        sb.append(", extend2=").append(extend2);
        sb.append(", loginTime=").append(loginTime);
        sb.append(", lastLoginTime=").append(lastLoginTime);
        sb.append(", errorCount=").append(errorCount);
        sb.append(", creationTime=").append(creationTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", sex=").append(sex);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}