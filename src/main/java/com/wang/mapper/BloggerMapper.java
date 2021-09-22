package com.wang.mapper;

import com.wang.entity.Blogger;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BloggerMapper {
    Blogger queryByUsername(@Param("username") String username);
}
