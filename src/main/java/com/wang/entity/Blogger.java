package com.wang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blogger {
    private Integer id;
    private String username;
    private String password;
    private String profile;
    private String nickName;
    private String sign;
    private String imageName;
}
