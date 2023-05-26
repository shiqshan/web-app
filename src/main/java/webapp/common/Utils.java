package webapp.common;

import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageInfo;

public class Utils {

    public static JSONObject wrapPageInfo(PageInfo pageInfo) {
        JSONObject result = new JSONObject();
        result.put("page", pageInfo.getPageNum());
        result.put("total", pageInfo.getTotal());
//        result.put("page", pageInfo.getPages());
        result.put("size", pageInfo.getPageSize());
        result.put("list", pageInfo.getList());
        return result;
    }
}
