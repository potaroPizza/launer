package com.ez.launer.admin.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminChartsServiceImpl implements AdminChartsService {
	
	private final AdminChartsDAO adminChartsDAO;
	
	
}
