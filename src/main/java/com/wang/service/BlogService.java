package com.wang.service;

import com.wang.entity.Blog;

import java.util.List;
import java.util.Map;

public interface BlogService {
    /**无参数查询所有博客列表*/
    List<Blog> countList();

    /**根据id查询一条博客*/
    Blog queryById(Integer id);

    /**不固定参数查询博客列表*/
    List<Blog> list(Map<String,Object> paramMap);

    /**不固定参数查询博客数*/
    Long getTotal(Map<String,Object> paramMap);

    Integer add(Blog blog);

    Integer update(Blog blog);

    Integer delete(Integer id);
}
