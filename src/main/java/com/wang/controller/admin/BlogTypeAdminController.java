package com.wang.controller.admin;

import com.wang.entity.BlogType;
import com.wang.entity.PageBean;
import com.wang.service.BlogTypeService;
import com.wang.utils.LayuiUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {
    @Resource
    BlogTypeService blogTypeService;

    @RequestMapping("/list")
    @ResponseBody
    public LayuiUtil list(@RequestParam(value = "page",required = false) String page,
                          @RequestParam(value = "limit",required = false) String limit) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(limit));
        Map<String,Object> map = new HashMap<>();
        map.put("start",pageBean.getStart());
        map.put("limit",pageBean.getLimit());
        //查询博客类型列表
        List<BlogType> blogTypeList = blogTypeService.list(map);
        //查询总共有多少条数据
        Long total = blogTypeService.getTotal(map);
        return LayuiUtil.data(total,blogTypeList);
    }

    @RequestMapping("/save")
    public String add(BlogType blogType) throws IOException {
        blogTypeService.add(blogType);
        return "/admin/blogTypeManage";
    }

    @RequestMapping("/update")
    public String update(BlogType blogType){
        blogTypeService.update(blogType);
        return "/admin/blogTypeManage";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id){
        blogTypeService.delete(id);
        return "/admin/blogTypeManage";
    }
}
