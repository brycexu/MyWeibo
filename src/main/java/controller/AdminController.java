package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import po.Admin;
import po.UserCustom;
import po.UserVo;
import service.AdminService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	/**
	 * 管理员登录页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="signin")
	public String signin() throws Exception {
		return "/admin/sign-in";
	}
	
	/**
	 * 管理员登录校验
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="loginAdmin", method=RequestMethod.POST)
	public String loginAdmin(
			@RequestParam("username") String username,
			@RequestParam("password") String password
			) throws Exception {
		Admin admin = new Admin();
		admin.setUsername(username);
		List<Admin> adminList = adminService.queryAdminByUsername(admin);
		if(adminList.size()==0){
			return "/admin/sign-in";
		}
		admin = adminList.get(0);
		if(password.equals(admin.getPassword())){
			return "/admin/index";
		} else {
			return "/admin/sign-in";
		}
	}

	/**
	 * 管理员综述响应
	 * @return 综述页面
	 * @throws Exception
	 */
	@RequestMapping(value="recapitulation")
	public String recapitulation() throws Exception {
		return "/admin/index";
	}

	/**
	 * 管理员管理微博
	 * @return 微博管理页面
	 */
	@RequestMapping(value = "weiboManagement")
	public String weiboManagement() {
		return "forward:/queryAllWeiboNowByAdmin.action?pageNo=1";
	}

	/**
	 * 管理员修改密码
	 * @return 登录页面
	 */
	@RequestMapping(value = "updatePassword")
	public String updatePassword(HttpServletRequest request, @RequestParam("oldpw")
			String oldpw, @RequestParam("newpw1") String newpw1, @RequestParam("newpw2") String newpw2)
			throws Exception {
		int flag = 1;
		Admin admin = new Admin();
		admin.setUsername("admin");
		List<Admin> adminList = adminService.queryAdminByUsername(admin);
		admin = adminList.get(0);
		String oldpassword = admin.getPassword();
		// 判断原密码是否一致
		if (!oldpw.equals(oldpassword)) {
			flag = 0;
			request.setAttribute("error_old", "原密码不正确！");
		}
		// 新密码是否一致
		if (!newpw1.equals(newpw2)) {
			flag = 0;
			request.setAttribute("error_new", "两次输入的新密码不一致");
		}
		if (flag == 0) {
			return "/admin/passwordChange";
		} else {
			admin.setPassword(newpw1);
			adminService.updatePassword(admin);
			request.setAttribute("updatepassword_success", "密码修改成功 请重新登录！");
			return "/admin/sign-in";
		}
	}

}
