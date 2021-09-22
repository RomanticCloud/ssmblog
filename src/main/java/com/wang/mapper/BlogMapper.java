package com.wang.mapper;

import com.wang.entity.Blog;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BlogMapper {
    /**无参数查询所有博客列表(供首页使用)*/
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
