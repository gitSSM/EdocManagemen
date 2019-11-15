package com.edo.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Data
/**
 * 电子文档条目表 实体类
 */
public class EdocEntry {
    private Integer id;//编号
    private Integer categoryId;//分类编号
    private String title;//标题
    private String summary;//摘要
    private String uploaduser;//上传人
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdate;//创建时间

}
