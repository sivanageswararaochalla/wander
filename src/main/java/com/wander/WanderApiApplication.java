package com.wander;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan({"com.wander"})
public class WanderApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(WanderApiApplication.class, args);
	}

}
