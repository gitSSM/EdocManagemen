package com.edo.dao;

import com.edo.pojo.EdocCategory;
import com.edo.pojo.EdocEntry;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 *  * 电子文档分类表
 *
 *  */


public interface EdocCategoryDao {
    /*查询所有分类表*/
    List<EdocCategory> getList();
}
