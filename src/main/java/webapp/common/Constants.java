package webapp.common;

public class Constants {
    public static final int RESULT_CODE_SUCCESS = 1;  // 逻辑处理成功请求
    public static final int RESULT_CODE_ERROR = 0;  // 逻辑处理失败请求
    public static final int RESULT_CODE_BAD_REQUEST = 412;  // 请求错误
    public static final int RESULT_CODE_NOT_LOGIN = 402;  // 未登录
    public static final int RESULT_CODE_PARAM_ERROR = 400;  // 传参错误
    public static final int RESULT_CODE_SERVER_ERROR = 500;  // 服务器错误
}
