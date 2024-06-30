package com.example.groupweb2.validator.constrain;

import com.example.groupweb2.validator.DoBValidator;
import jakarta.validation.Constraint;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
@Constraint(validatedBy = {DoBValidator.class})
public @interface DoBConstrain {
    int min();
}
