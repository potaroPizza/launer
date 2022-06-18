package com.ez.launer.category.model;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CategoryDAO {
    List<Map<String, Object>> selectAllCategoryGroup();
    List<CategoryVO> selectAllCategory(int categoryGroup);
    CategoryVO selectByNo(int no);
}
