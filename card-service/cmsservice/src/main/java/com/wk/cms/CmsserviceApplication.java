package com.wk.cms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

//@EnableScheduling
@EnableEurekaClient //表明自己是一个服务客户端
@SpringBootApplication
@MapperScan("com.wk.cms.dao")
public class CmsserviceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CmsserviceApplication.class, args);
	}
}
