package com.ez.launer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class LaunerApplication {

	public static void main(String[] args) {
		SpringApplication.run(LaunerApplication.class, args);
	}

}
