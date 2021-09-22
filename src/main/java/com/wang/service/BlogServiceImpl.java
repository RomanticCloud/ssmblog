package com.wang.service;

import com.wang.entity.Blog;
import com.wang.mapper.BlogMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BlogServiceImpl implements BlogService{
    @Resource
    BlogMapper blogMapper;

    @Override
    public List<Blog> countList() {
        return blogMapper.countList();
    }

    @Override
    public Blog queryById(Integer id) {
        return blogMapper.queryById(id);
    }

    @Override
    public List<Blog> list(Map<String, Object> paramMap) {
        return blogMapper.list(paramMap);
    }

    @Override
    public Long getTotal(Map<String, Object> paramMap) {
        return blogMapper.getTotal(paramMap);
    }

    @Override
    public Integer add(Blog blog) {
        return blogMapper.add(blog);
    }

    @Override
    public Integer update(Blog blog) {
        return blogMapper.update(blog);
    }

    @Override
    public Integer delete(Integer id) {
        return blogMapper.delete(id);
    }
}
