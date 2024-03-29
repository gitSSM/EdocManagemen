package com.edo.dao;

import com.edo.pojo.EdocCategory;
import com.edo.pojo.EdocEntry;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/*
 * 电子文档条目表
 * */

public interface EdocEntryDao {

    /*
     *查询所有电子文档条目
     *
     * */
    List<EdocEntry> getlist(@Param("categoryId")String categoryId );

    /**
     * 添加
     */
    int getAdd(EdocEntry edocEntry);
    /**
     * 修改
     */
    int getUpdate(EdocEntry edocEntry);
    /**
     * 按id查询
     */
    EdocEntry getById(@Param("id")String id);
    /**
     * 删除
     */
    int getDel(@Param("id")Integer id);
}
