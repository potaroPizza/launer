package com.ez.launer.category.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{
    private final CategoryDAO categoryDAO;

    @Override
    public List<Map<String, Object>> selectAllCategoryGroup() {
        return categoryDAO.selectAllCategoryGroup();
    }
}
