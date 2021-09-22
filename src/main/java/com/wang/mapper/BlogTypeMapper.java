package com.wang.mapper;

import com.wang.entity.BlogType;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BlogTypeMapper {
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
