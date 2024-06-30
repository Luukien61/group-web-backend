package com.example.groupweb2.validator.constrain;

import com.example.groupweb2.validator.PasswordValidator;
import jakarta.validation.Constraint;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME) //1
@Constraint(validatedBy = {PasswordValidator.class})
public @interface PasswordConstrain {
    int min();
}
/*
Retention policy define the period that this constrain will be validated the value.
Here we want to check when runtime, others annotation checking value in compile time
like Lombok's annotations. Those annotations will be validated in compile.
 */