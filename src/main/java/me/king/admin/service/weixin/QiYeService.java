package me.king.admin.service.weixin;

import java.util.Map;

import me.king.wx.token.AccessToken;

/**  
 * @Title:  		QiYeService.java    
 * @Description:    微信企业号服务
 * @author: 		WangBuEr
 * @date:   		2017年4月1日 上午10:56:40   
 * @version 		V1.0
 */
public interface QiYeService {
	/**
	 * 通讯录同步
	 * @param token 令牌
	 * @return 同步情况
	 */
	Map<String, Integer> addressBookAsync(AccessToken token);
}

