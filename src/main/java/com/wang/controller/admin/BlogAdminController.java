package com.wang.controller.admin;

import com.wang.entity.Blog;
import com.wang.entity.PageBean;
import com.wang.service.BlogService;
import com.wang.utils.LayuiUtil;
import com.wang.utils.ResponseUtil;
import com.wang.utils.StringUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

    @Resource
    BlogService blogService;

    @RequestMapping("/save")
    public String save(Blog blog, HttpServletResponse response) throws Exception {
        Integer resultTotal = blogService.add(blog);
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    @RequestMapping("/list")
    @ResponseBody
    public LayuiUtil list(@RequestParam(value = "page",required = false) String page,
                       @RequestParam(value = "limit",required = false) String limit,Blog blog){
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(limit));
        HashMap<String, Object> map = new HashMap<>();
        map.put("start",pageBean.getStart());
        map.put("limit",pageBean.getLimit());
        map.put("title", StringUtil.formatLike(blog.getTitle()));
        List<Blog> blogList = blogService.list(map);
        Long total = blogService.getTotal(map);
        return LayuiUtil.data(total,blogList);
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id){
        blogService.delete(id);
        return "/admin/blogTypeManage";
    }
}
