package com.edo.service;

import com.edo.pojo.EdocCategory;
import com.edo.pojo.EdocEntry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EdocEntryService {
    /*
     *查询所有电子文档条目
     *
     * */
    List<EdocEntry> getlist(String categoryId );
    /**
     * 添加
     */
    boolean getAdd(EdocEntry edocEntry);
    /**
     * 修改
     */
    boolean getUpdate(EdocEntry edocEntry);
    /**
     * 按id查询
     */
    EdocEntry getById(String id);
    /**
     * 删除
     */
    boolean getDel(Integer id);


}
