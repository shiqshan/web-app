package webapp.common;

import org.springframework.util.StringUtils;

public class RS {
    private static final String DEFAULT_SUCCESS_MESSAGE = "success";
    private static final String DEFAULT_ERROR_MESSAGE = "error";

    public static Result success() {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setSuccess(true);
        return result;
    }

    public static Result success(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setSuccess(true);
        result.setMessage(message);
        return result;
    }

    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setSuccess(true);
        result.setData(data);
        return result;
    }

    public static Result nullResult(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_SUCCESS);
        result.setSuccess(true);
        result.setMessage(message);
        return result;
    }

    public static Result error(String message) {
        Result result = new Result();
        result.setCode(Constants.RESULT_CODE_ERROR);
        result.setSuccess(false);
        if (StringUtils.isEmpty(message)) {
            result.setMessage(DEFAULT_ERROR_MESSAGE);
        } else {
            result.setMessage(message);
        }
        return result;
    }

    public static Result error(int code, String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        result.setSuccess(false);
        return result;
    }
}
