package com.wang.service;

import com.wang.entity.Blogger;
import com.wang.mapper.BloggerMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class BloggerServiceImpl implements BloggerService{
    @Resource
    BloggerMapper bloggerMapper;

    @Override
    public Blogger queryByUsername(String username) {
        return bloggerMapper.queryByUsername(username);
    }
}
