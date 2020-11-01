package com.nantian.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.ToStringSerializer;

/**
 * <p>ClassName: UserVO</p>
 * <p>Description: 用户</p>
 * <p>Copyright: Copyright©2014</p>
 * <p>Company: 广州南天电脑系统有限公司</p>
 * <p>Date: 2019-12-01</p>
 *
 * @author 刘晓辉
 * @version 1.0
 */
public class UserVO {
    /**
     * ID主键
     */
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
     * 性别
     */
    private String sex;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOrgNo() {
        return orgNo;
    }

    public void setOrgNo(String orgNo) {
        this.orgNo = orgNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getLandline() {
        return landline;
    }

    public void setLandline(String landline) {
        this.landline = landline;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    @Override
    public String toString() {
        return "UserVO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", orgNo='" + orgNo + '\'' +
                ", phoneNo='" + phoneNo + '\'' +
                ", landline='" + landline + '\'' +
                ", idCard='" + idCard + '\'' +
                ", email='" + email + '\'' +
                ", adress='" + adress + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", status='" + status + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }
}
