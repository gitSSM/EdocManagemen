package com.edo.service;

import com.edo.dao.EdocEntryDao;
import com.edo.pojo.EdocCategory;
import com.edo.pojo.EdocEntry;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class EdocEntryServiceImpl implements EdocEntryService {
    @Resource

    private EdocEntryDao edocEntryDao;

    /**
     * 查询所有
     * @return  list集合
     */

    @Override
    public List<EdocEntry> getlist(String categoryId) {
        List<EdocEntry> list=edocEntryDao.getlist(categoryId);
        for (EdocEntry entry:list){
            System.out.println(entry);
        }
        return list;
    }

    /**
     * 添加
     * @param edocEntry 实体类
     * @return boolean
     */
    @Override
    public boolean getAdd(EdocEntry edocEntry) {
        boolean falg=false;
        int count=edocEntryDao.getAdd(edocEntry);
        if(count>0){
            falg=true;
        }
        return falg;
    }

    /**
     * 修改
     * @param edocEntry
     * @return
     */
    @Override
    public boolean getUpdate(EdocEntry edocEntry) {
        boolean falg=false;
        int coutn=edocEntryDao.getUpdate(edocEntry);
        if (coutn>0){
            falg=true;
        }
        return falg;
    }

    /**
     * 按id查询
     * @param id
     * @return
     */
    @Override
    public EdocEntry getById(String id) {
        EdocEntry edocEntry=edocEntryDao.getById(id);
        return edocEntry;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public boolean getDel(Integer id) {
        boolean falg=false;
        int coutn=edocEntryDao.getDel(id);
        if (coutn>0){
            falg=true;
        }

        return falg;
    }
}
