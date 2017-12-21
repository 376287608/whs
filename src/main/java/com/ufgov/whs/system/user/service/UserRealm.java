package com.ufgov.whs.system.user.service;

import java.io.Serializable;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Service;

import com.google.common.base.Objects;
import com.ufgov.whs.common.utils.security.Encodes;
import com.ufgov.whs.company.bean.CompanyUser;
import com.ufgov.whs.system.bankuser.bean.BankUser;
import com.ufgov.whs.system.resource.bean.SysResource;
import com.ufgov.whs.system.resource.service.ResourceService;
import com.ufgov.whs.system.role.bean.SysRole;
import com.ufgov.whs.system.user.bean.SysUser;
import com.ufgov.whs.system.utils.CaptchaException;
import com.ufgov.whs.system.utils.UsernamePasswordCaptchaToken;

/**
 * 用户登录授权service(shrioRealm)
 * @author fucj
 * @date 2015年1月14日
 */
@Service
@DependsOn({"userDao","resourceDao","rolePermissionDao"})
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ResourceService resourceService;

	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordCaptchaToken token = (UsernamePasswordCaptchaToken) authcToken; 
		SysUser user = userService.getUser(token.getUsername());
		BankUser buser = userService.getBankUser(token.getUsername());
		CompanyUser cuser = userService.getCompanyUser(token.getUsername());
		if (user != null) {
			byte[] salt = Encodes.decodeHex(user.getSalt());			
			ShiroUser shiroUser=new ShiroUser(user.getId(), user.getLoginName(),user.getUserType());
			//设置用户session
			Session session =SecurityUtils.getSubject().getSession();
			session.setAttribute("user", user);
			session.setAttribute("loginPath", ((UsernamePasswordCaptchaToken)authcToken).getLoginPath());
			if(buser!=null){
				session.setAttribute("bankuser",buser );
			}
			if(cuser!=null){
				session.setAttribute("companyuser",cuser );
			}
			return new SimpleAuthenticationInfo(shiroUser,user.getPassword(), ByteSource.Util.bytes(salt), getName());
		} else {
			return null;
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		SysUser user = userService.getUser(shiroUser.loginName);
		List<SysRole> userRoles = userService.getUserRoles(shiroUser.id);
		//把principals放session中 key=userId value=principals
		SecurityUtils.getSubject().getSession().setAttribute(String.valueOf(user.getId()),SecurityUtils.getSubject().getPrincipals());
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		//赋予角色
		for(SysRole userRole:userRoles){
			info.addRole(userRole.getName());
		}
		//赋予权限
		for(SysResource resource:resourceService.getPermissions(user.getId())){
			if(StringUtils.isNotBlank(resource.getResourceType()))
			info.addStringPermission(resource.getResourceType());
		}
		return info;
	}
	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@SuppressWarnings("static-access")
	@PostConstruct
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(userService.HASH_ALGORITHM);
		matcher.setHashIterations(userService.HASH_INTERATIONS);
		setCredentialsMatcher(matcher);
	}

	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		public Integer id;
		public String loginName;
		public String userType;
		public String name;
		public BankUser bankUser;
		public CompanyUser companyUser;

		public ShiroUser(Integer id, String loginName, String userType) {
			this.id = id;
			this.loginName = loginName;
			this.userType = userType;
		}
		
		public ShiroUser(Integer id, String loginName, String name, String userType) {
			this.id = id;
			this.loginName = loginName;
			this.name = name;
			this.userType = userType;
		}
		
		public ShiroUser(Integer id, String loginName,  String userType, BankUser bankUser ) {
			this.id = id;
			this.loginName = loginName;
			this.bankUser = bankUser;
			this.userType = userType;
		}
		
		public ShiroUser(Integer id, String loginName,  String userType, CompanyUser companyUser ) {
			this.id = id;
			this.loginName = loginName;
			this.companyUser = companyUser;
			this.userType = userType;
		}
		
		public Integer getId(){
			return id;
		}
		
		public String getUserType() {
			return userType;
		}
		
		public String getName() {
			return name;
		}
		public BankUser getBankUser() {
			return bankUser;
		}
        
		public CompanyUser getCompanyUser() {
			return companyUser;
		}
		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return loginName;
		}

		/**
		 * 重载hashCode,只计算loginName;
		 */
		@Override
		public int hashCode() {
			return Objects.hashCode(loginName);
		}

		/**
		 * 重载equals,只计算loginName;
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (getClass() != obj.getClass()) {
				return false;
			}
			ShiroUser other = (ShiroUser) obj;
			if (loginName == null) {
				if (other.loginName != null) {
					return false;
				}
			} else if (!loginName.equals(other.loginName)) {
				return false;
			}
			return true;
		}
	}
	
	@Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }
 
}
