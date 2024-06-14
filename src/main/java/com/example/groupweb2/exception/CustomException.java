package com.example.groupweb2.exception;

public class CustomException extends Exception{
    public CustomException(String message) {
        super(message);
    }
}
/*

If you want to throw a exception throw it in service layer.

It will be better to define one more package named exception.

and have your custom exception, exception response and exception handler in it.

 */