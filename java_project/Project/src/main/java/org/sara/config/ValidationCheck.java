package org.sara.config;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.sara.util.RegisterRequest;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ValidationCheck implements Validator {
	private static final String emailRegExp = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
			"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private Pattern pattern;

	public ValidationCheck() {
		pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegisterRequest regr = (RegisterRequest) target;
		
		if(regr.getEmail() == null || regr.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "required", "필수정보입니다.");
		} else {
			Matcher matcher = pattern.matcher(regr.getEmail());
			if(!matcher.matches()) {
				errors.rejectValue("email", "bad", "잘못된 형식입니다");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"name", "required", "필수 정보입니다.");
		ValidationUtils.rejectIfEmpty(errors, "pw", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmpty(errors, "pwCheck", "required", "필수 정보입니다");
		if(!regr.getPw().isEmpty()) {
			if(!regr.pwEqual()) {
				errors.rejectValue("pwCheck", "nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}
	}

}
