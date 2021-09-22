package com.wang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Blog implements Serializable {
    private Integer id;

    private String title;

    private String summary;

    private Date releaseDate;

    /**博客数量*/
    private Integer blogCount;

    private Integer clickHit;

    private Integer replyHit;

    private String content;

    private BlogType blogType;

    private String keyWord;

    /**纯文本格式*/
    private String contentNoTag;

    /**字符串格式发表时间*/
    private String releaseDateStr;
}
