package com.demo.awsec2lab1;

import com.demo.awsec2lab1.entity.User;
import com.demo.awsec2lab1.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.UUID;

@SpringBootApplication
public class AwsEc2Lab1Application {

    public static void main(String[] args) {
        SpringApplication.run(AwsEc2Lab1Application.class, args);
    }


    @Bean
    CommandLineRunner commandLineRunner(UserRepository userRepository){
        return args -> {
            for (int i = 1; i <= 10; i++) {
                userRepository.save(User.builder()
                        .id(UUID.randomUUID().toString())
                        .firstName("A"+i)
                        .lastName("Nguyen Van")
                        .email("nva"+i+"@gmail.com")
                        .build());
            }
        };
    }
}
