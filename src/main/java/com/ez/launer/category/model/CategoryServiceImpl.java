package com.ez.launer.category.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{
    private final CategoryDAO categoryDao;

    @Override
    public List<Map<String, Object>> selectAllCategoryGroup() {
        return categoryDao.selectAllCategoryGroup();
    }

	@Override
	public List<CategoryVO> selectAllCategory(int categoryGroup) {
		return categoryDao.selectAllCategory(categoryGroup);
	}

	@Override
	public CategoryVO selectByNo(int no) {
		return categoryDao.selectByNo(no);
	}
}
