package org.sara.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*
		 * http .authorizeRequests() .antMatchers("/signup", "/css/**",
		 * "/js/**").permitAll() .anyRequest().authenticated() .and() .formLogin()
		 * .loginPage("/login") .permitAll() .and() .logout() .permitAll();
		 */
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		// 비밀번호를 암호화 시켜주기 위해 설정
		return new BCryptPasswordEncoder();
	}
}
