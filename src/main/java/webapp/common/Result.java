package webapp.common;

import lombok.Data;

import java.io.Serializable;

@Data
public class Result<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private int code;
    private String message;
    private T data;

    public Result(){

    }

    public Result(int code, String message){
        this.code = code;
        this.message = message;
    }

    // 服务器处理失败
//    public Result failure(){
//        return new Result(Constants.RESULT_CODE_SERVER_ERROR, "服务器错误");
//    }
}
