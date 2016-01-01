package me.king.admin.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 
 *@Title:  
 *@Description:  config.properties配置文件映射
 *@Author:BuEr  
 *@Since:2016年8月31日  
 *@Version:1.1.0
 */
@Component
public class ConfigProperties {
	@Value("${des.key}")
	private String desKey;
	@Value("${template.dir}")
	private String templateDir;
	@Value("${platform.name}")
	private String platformName;
	@Value("${member.activate.url}")
	private String memberActivateUrl;
	@Value("${qiniu.accesskey}")
	private String qiNiuAecretKey;
	@Value("${qiniu.secretkey}")
	private String qiNiuSecretKey;
	@Value("${qiniu.bucketname}")
	private String qiNiuBucketName;
	@Value("${qiniu.link}")
	private String qiNiuLink;
	@Value("${wx.qy.corpid}")
	private String wxQyCorpid;
	@Value("${wx.qy.corpsecret}")
	private String wxQyCorpsecret;
	public String getDesKey() {
		return desKey;
	}
	public void setDesKey(String desKey) {
		this.desKey = desKey;
	}
	public String getTemplateDir() {
		return templateDir;
	}
	public void setTemplateDir(String templateDir) {
		this.templateDir = templateDir;
	}
	public String getPlatformName() {
		return platformName;
	}
	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}
	public String getMemberActivateUrl() {
		return memberActivateUrl;
	}
	public void setMemberActivateUrl(String memberActivateUrl) {
		this.memberActivateUrl = memberActivateUrl;
	}
	public String getQiNiuAecretKey() {
		return qiNiuAecretKey;
	}
	public void setQiNiuAecretKey(String qiNiuAecretKey) {
		this.qiNiuAecretKey = qiNiuAecretKey;
	}
	public String getQiNiuSecretKey() {
		return qiNiuSecretKey;
	}
	public void setQiNiuSecretKey(String qiNiuSecretKey) {
		this.qiNiuSecretKey = qiNiuSecretKey;
	}
	public String getQiNiuBucketName() {
		return qiNiuBucketName;
	}
	public void setQiNiuBucketName(String qiNiuBucketName) {
		this.qiNiuBucketName = qiNiuBucketName;
	}
	public String getQiNiuLink() {
		return qiNiuLink;
	}
	public void setQiNiuLink(String qiNiuLink) {
		this.qiNiuLink = qiNiuLink;
	}
	public String getWxQyCorpid() {
		return wxQyCorpid;
	}
	public void setWxQyCorpid(String wxQyCorpid) {
		this.wxQyCorpid = wxQyCorpid;
	}
	public String getWxQyCorpsecret() {
		return wxQyCorpsecret;
	}
	public void setWxQyCorpsecret(String wxQyCorpsecret) {
		this.wxQyCorpsecret = wxQyCorpsecret;
	}
	
}
