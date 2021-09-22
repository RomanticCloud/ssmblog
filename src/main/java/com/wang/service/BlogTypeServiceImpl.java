package com.wang.service;

import com.wang.entity.BlogType;
import com.wang.mapper.BlogTypeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class BlogTypeServiceImpl implements BlogTypeService{
    @Resource
    BlogTypeMapper blogTypeMapper;

    @Override
    public List<BlogType> countList() {
        return blogTypeMapper.countList();
    }

    @Override
    public BlogType queryById(Integer id) {
        return blogTypeMapper.queryById(id);
    }

    @Override
    public List<BlogType> list(Map<String, Object> paramMap) {
        return blogTypeMapper.list(paramMap);
    }

    @Override
    public Long getTotal(Map<String, Object> paramMap) {
        return blogTypeMapper.getTotal(paramMap);
    }

    @Override
    public Integer add(BlogType blogType) {
        return blogTypeMapper.add(blogType);
    }

    @Override
    public Integer update(BlogType blogType) {
        return blogTypeMapper.update(blogType);
    }

    @Override
    public Integer delete(Integer id) {
        return blogTypeMapper.delete(id);
    }
}
