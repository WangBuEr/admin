package me.king.admin.web.listener;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import me.king.admin.util.ConfigProperties;
import me.king.wx.token.AccessToken;

/**  
 * @Title:  		AccessTokenListener.java    
 * @Description:    微信AccessToken获取监听器   
 * @author: 		WangBuEr
 * @date:   		2017年3月30日 下午4:02:10   
 * @version 		V1.0
 */
public class AccessTokenListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		final ServletContext context = event.getServletContext();
		ApplicationContext ctx = WebApplicationContextUtils
				.getWebApplicationContext(context);
		final ConfigProperties config = ctx.getBean(ConfigProperties.class);
		AccessToken wxqyToken = AccessToken.getAccessToken(config.getWxQyCorpid(), config.getWxQyCorpsecret());
		context.setAttribute("wxqyToken", wxqyToken);
		ScheduledThreadPoolExecutor stpe = new ScheduledThreadPoolExecutor(1);
		stpe.scheduleWithFixedDelay(new Runnable() {
			
			@Override
			public void run() {
				AccessToken wxqyToken = AccessToken.getAccessToken(config.getWxQyCorpid(), config.getWxQyCorpsecret());
				context.setAttribute("wxqyToken", wxqyToken);
			}
		}, 7000, 7000, TimeUnit.SECONDS);
	}

}
