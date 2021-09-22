package com.wang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogType implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String typeName;
    private Integer orderNo;

    /**该类型下博客数量*/
    private Integer blogCount;

    public BlogType(String typeName,Integer orderNo){
        this.typeName=typeName;
        this.orderNo=orderNo;
    }
}
