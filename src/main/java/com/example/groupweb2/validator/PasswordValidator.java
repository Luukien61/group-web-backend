package com.example.groupweb2.validator;

import com.example.groupweb2.validator.constrain.PasswordConstrain;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordValidator implements ConstraintValidator<PasswordConstrain, String> {
    private int minPasswordLength;
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return s.length()>=minPasswordLength;
    }

    @Override
    public void initialize(PasswordConstrain constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
        minPasswordLength= constraintAnnotation.min();
    }
}
