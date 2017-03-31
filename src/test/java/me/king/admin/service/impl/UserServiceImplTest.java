package me.king.admin.service.impl;

import static org.junit.Assert.*;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;

import me.king.admin.ServiceBasicTest;
import me.king.admin.domain.User;
import me.king.admin.service.manager.UserService;

public class UserServiceImplTest extends ServiceBasicTest {
	@Resource
	private UserService userService;
	@Test
	public void testAddOrUpdate(){
		for(int i = 1000000; i<5000000; i++){
			
			User u = new User();
			u.setLoginName("test_login_" + i);
			Byte age = new Byte((byte) 27);
			u.setAge(age);
			u.setName("test_name_" + i);
			u.setPhone("18651807631");
			u.setCreateTime(new Date());
			u.setOrganizationId(18);
			u.setSex((byte)1);
			u.setStatus((byte)0);
			u.setUserType((byte)0);
			userService.addOrUpdate(u);
			System.out.println("adding......" + u.getLoginName());
		}
	}
}
