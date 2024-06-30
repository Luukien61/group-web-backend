package com.example.groupweb2.validator;

import com.example.groupweb2.validator.constrain.DoBConstrain;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Date;

public class DoBValidator implements ConstraintValidator<DoBConstrain, Date> {
    private int minAge;
    @Override
    public void initialize(DoBConstrain constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
        minAge=constraintAnnotation.min();
    }

    @Override
    public boolean isValid(Date date, ConstraintValidatorContext constraintValidatorContext) {
        LocalDate now = LocalDate.now();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        Period gap = Period.between(localDate,now);
        return gap.getYears()>=minAge;
    }
}
