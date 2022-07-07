package com.ez.launer.configuration;

import com.ez.launer.controller.AdminLoginInterceptor;

import com.ez.launer.controller.DeliveryInterceptor;
import com.ez.launer.controller.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 레지스트리에 인터셉터 등록
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/laundryService/**")
				.addPathPatterns("/mypage/**")
				.addPathPatterns("/user/**")
				.excludePathPatterns("/user/login/**")
				.excludePathPatterns("/user/join/**")
				.excludePathPatterns("/user/findId/**")
				.excludePathPatterns("/user/findPwd/**")
				.excludePathPatterns("/user/checkEmail/**")
				.excludePathPatterns("/user/checkHp/**")
				.excludePathPatterns("/mypage/signout");
		
		registry.addInterceptor(new AdminLoginInterceptor())
		.addPathPatterns("/admin/**")
		.excludePathPatterns("/admin/adminLogin");


		registry.addInterceptor(new DeliveryInterceptor())
				.addPathPatterns("/delivery/**")
				.excludePathPatterns("/delivery/join/**")
				.excludePathPatterns("/delivery/checkDmail/**")
				.excludePathPatterns("/delivery/checkDhp/**");

		/*registry.addInterceptor(new AdminLoginInterceptor())
		.excludePathPatterns("/admin/login/adminLogin")
		//=> 인터셉처 설정한 경로중에서, 제외할 경로 설정(예외처리)
		.addPathPatterns("/admin/**");*/
		//=> 같은뜻! => .addPathPatterns("/admin/*/*", "/admin/*");
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		return multipartResolver;
	}
	
}