package com.daniel.common;

/**
 * 响应结果生成工具
 * 该ResultGenerator类是一个工具类，用于生成响应结果对象Result
 */
public class ResultGenerator {
    private static final String DEFAULT_SUCCESS_MESSAGE = "SUCCESS";
    private static final String DEFAULT_FAIL_MESSAGE = "FAIL";

    // 生成一个表示成功的Result对象，其中resultCode为Constants.RESULT_CODE_SUCCESS，message为"SUCCESS"
    public static Result genSuccessResult() {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        return result;
    }

    //生成一个表示成功的Result对象，其中resultCode为Constants.RESULT_CODE_SUCCESS，message为"SUCCESS"，同时将给定的数据对象data设置到Result中
    public static Result genSuccessResult(Object data) {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setData(data);
        return result;
    }

    //生成一个表示失败的Result对象，其中resultCode为Constants.RESULT_CODE_SERVER_ERROR，message为"FAIL"
    public static Result genFailResult(String message) {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SERVER_ERROR);
        if (message == null || message.length() < 1) {
            message = DEFAULT_FAIL_MESSAGE;
        }
        result.setMessage(message);
        return result;
    }

}
