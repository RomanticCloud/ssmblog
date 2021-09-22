package com.wang.service;

import com.wang.entity.Blogger;

public interface BloggerService {
    Blogger queryByUsername(String username);
}
