package com.wang.security;

import com.wang.entity.Blogger;
import com.wang.service.BloggerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

public class MyRealm extends AuthorizingRealm {
    @Resource
    BloggerService bloggerService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //登陆验证token：令牌，基于用户名和密码的令牌
        String username = (String) token.getPrincipal();
        Blogger blogger = bloggerService.queryByUsername(username);
        if (blogger!=null){
            SecurityUtils.getSubject().getSession().setAttribute("currentUser",blogger);
            return new SimpleAuthenticationInfo(blogger.getUsername(), blogger.getPassword(), getName());
        }else{
            throw new UnknownAccountException();
        }
    }
}
