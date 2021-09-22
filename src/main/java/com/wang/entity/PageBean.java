package com.wang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean {

    /**当前页码*/
    private int page;

    /**单个页面数据的数量*/
    private int limit;

    /**开始条数*/
    private int start;

    public PageBean(int page,int limit){
        super();
        this.page=page;
        this.limit = limit;
    }

    public int getStart() {
        return (this.page - 1)*this.limit;
    }
}
