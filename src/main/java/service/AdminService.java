package service;

import java.util.List;

import po.Admin;

public interface AdminService {

	List<Admin> queryAdminByUsername(Admin admin);

	public void updatePassword(Admin admin) throws Exception;

}
