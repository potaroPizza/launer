package com.ez.launer.category.model;


import java.util.List;
import java.util.Map;

public interface CategoryService {
    List<Map<String, Object>> selectAllCategoryGroup();
//    List<CategoryVO> selectAllCategory(int categoryGroup);
}
