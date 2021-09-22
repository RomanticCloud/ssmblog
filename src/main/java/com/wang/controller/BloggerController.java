package com.wang.controller;

import com.wang.entity.Blogger;
import com.wang.utils.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/blogger")
public class BloggerController {

    @RequestMapping("/login")
    public String login(Blogger blogger, HttpServletRequest request, Model model){
        String username = blogger.getUsername();
        model.addAttribute("user",username);
        String password = blogger.getPassword();
        String pwd  = CryptographyUtil.md5(password,"oncecipher");
        UsernamePasswordToken token = new UsernamePasswordToken(username,pwd);

        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return "redirect:/admin/main.jsp";
        } catch (AuthenticationException e) {
            e.printStackTrace();
            request.setAttribute("blogger",blogger);
            request.setAttribute("errorInfo","用户名或密码错误");
        }
        return "login";
    }


}
