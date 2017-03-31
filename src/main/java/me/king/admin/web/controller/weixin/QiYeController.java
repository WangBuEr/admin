package me.king.admin.web.controller.weixin;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;

import me.king.admin.service.weixin.QiYeService;
import me.king.admin.web.vo.BusinessExecutionResult;
import me.king.wx.token.AccessToken;

/**  
 * @Title:  		QiYeWeiXinManagerController.java    
 * @Description:    企业微信控制器
 * @author: 		WangBuEr
 * @date:   		2017年3月31日 下午3:11:01   
 * @version 		V1.0
 */
@Controller
@RequestMapping("weixin/qiye")
public class QiYeController {
	@Resource
	private QiYeService qyService;
	@RequiresRoles(value = { "admin"})
	@RequestMapping("manager")
	public String manager(){
		return "/weixin/qy/manager";
	}
	@RequestMapping("async")
	public BusinessExecutionResult async(){
		ServletContext context = ContextLoader.getCurrentWebApplicationContext().getServletContext();
		AccessToken token = (AccessToken) context.getAttribute("wxqyToken");
		qyService.addressBookAsync(token);
		return BusinessExecutionResult.success();
	}
}
