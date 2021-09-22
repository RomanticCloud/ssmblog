package com.wang.service;

import com.wang.entity.BlogType;

import java.util.List;
import java.util.Map;

public interface BlogTypeService {
    /**无参数查询所有博客列表*/
    List<BlogType> countList();

    /**根据id查询一条博客类型*/
    BlogType queryById(Integer id);

    /**不固定参数查询博客类型列表*/
    List<BlogType> list(Map<String,Object> paramMap);

    /**不固定参数查询博客类型数*/
    Long getTotal(Map<String,Object> paramMap);

    Integer add(BlogType blogType);

    Integer update(BlogType blogType);

    Integer delete(Integer id);
}
