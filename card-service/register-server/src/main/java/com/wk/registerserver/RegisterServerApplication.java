package com.wk.registerserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer //指定为服务注册中心
@SpringBootApplication
public class RegisterServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(RegisterServerApplication.class, args);
	}
}
