package webapp.common;

import org.springframework.util.StringUtils;

public class ResultGenerator {
    private static final String DEFAULT_SUCCESS_MESSAGE = "success";
    private static final String DEFAULT_ERROR_MESSAGE = "error";

    public static Result successResult() {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        return result;
    }

    public static Result successResult(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(message);
        return result;
    }

    public static Result successResult(Object data) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setData(data);
        return result;
    }

    public static Result errorResult(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SERVER_ERROR);
        if (StringUtils.isEmpty(message)) {
            result.setMessage(DEFAULT_ERROR_MESSAGE);
        } else {
            result.setMessage(message);
        }
        return result;
    }

    public static Result nullResult(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(message);
        return result;
    }

    public static Result errorResult(int code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }
}
