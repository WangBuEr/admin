package me.king.admin.web.controller;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**  
 * @Title:  		QiYeWeiXinManagerController.java    
 * @Description:    企业微信控制器
 * @author: 		WangBuEr
 * @date:   		2017年3月31日 下午3:11:01   
 * @version 		V1.0
 */
@Controller
@RequestMapping("qywx")
public class QiYeWeiXinController {
	@RequiresRoles(value = { "admin"})
	@RequestMapping("manager")
	public String manager(){
		return "/weixin/qy/manager";
	}
}
