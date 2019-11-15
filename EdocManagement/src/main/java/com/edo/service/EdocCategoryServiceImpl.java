package com.edo.service;

import com.edo.dao.EdocCategoryDao;
import com.edo.pojo.EdocCategory;
import com.edo.pojo.EdocEntry;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EdocCategoryServiceImpl implements EdocCategoryService {
    @Resource
    private EdocCategoryDao edocCategoryDao;


    @Override
    public List<EdocCategory> getlist() {
        List<EdocCategory> list=edocCategoryDao.getList();
        for (EdocCategory category:list) {
            System.out.println(category);
        }
        return list;
    }
}
