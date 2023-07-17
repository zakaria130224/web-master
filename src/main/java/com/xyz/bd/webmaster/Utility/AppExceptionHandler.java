package com.xyz.bd.webmaster.Utility;

import com.xyz.bd.webmaster.Models.common.ResponseModel.ErrorMessageModel;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;


@RestControllerAdvice
public class AppExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ErrorMessageModel springHandleNotFound(Exception ex, WebRequest webRequest) {
        ErrorMessageModel errorMessageModel = new ErrorMessageModel();
        errorMessageModel.setErrorCode(500);
        errorMessageModel.setMessage(ex.getMessage());
        return errorMessageModel;
    }

}
