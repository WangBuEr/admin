package me.king.admin.service.weixin.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import me.king.admin.domain.Organization;
import me.king.admin.domain.User;
import me.king.admin.persistence.OrganizationMapper;
import me.king.admin.persistence.UserMapper;
import me.king.admin.service.weixin.QiYeService;
import me.king.wx.qy.AddressBookManager;
import me.king.wx.qy.department.vo.Department;
import me.king.wx.token.AccessToken;

/**  
 * @Title:  		QiYeServiceImpl.java    
 * @Description:    微信企业号服务实现  
 * @author: 		WangBuEr
 * @date:   		2017年4月1日 上午10:57:15   
 * @version 		V1.0
 */
@Service
public class QiYeServiceImpl implements QiYeService {
	@Resource
	private OrganizationMapper orgDao;
	@Resource
	private UserMapper userDao;
	@Override
	public Map<String, Integer> addressBookAsync(AccessToken token) {
		List<Organization> orgList = orgDao.selectAll();
		List<Department> asyncDeptList = new ArrayList<>();
		for(Organization org : orgList){
			Department dept = new Department(String.valueOf(org.getId()), org.getName(), String.valueOf(org.getPid()),
					String.valueOf(org.getSeq()));
			asyncDeptList.add(dept);
		}
		List<User> userList = userDao.selectAll();
		List<me.king.wx.qy.user.vo.User> asyncUserList = new ArrayList<>();
		for(User user : userList){
			List<String> depts = new ArrayList<>(1);
			depts.add(String.valueOf(user.getOrganizationId()));
			String sex = "0".equals(Byte.toString(user.getSex())) ? "2":Byte.toString(user.getSex());
			me.king.wx.qy.user.vo.User asyncUser = new me.king.wx.qy.user.vo.User(user.getLoginName(), user.getName(), depts, user.getPhone(), sex, user.getWx());
			asyncUserList.add(asyncUser);
		}
		return AddressBookManager.sync(token, asyncDeptList, asyncUserList);
	}
	
}
