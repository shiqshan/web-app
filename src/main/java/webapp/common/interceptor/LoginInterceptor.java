package webapp.common.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import webapp.pojo.User;

@RestController
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("u_id");
        System.out.println("当前id" + id);
        System.out.println("当前访问路径" + request.getRequestURI());
        if (id == null) {
            // 如果用户未登录，则跳转到登录页面
//            response.setHeader("Access-Control-Allow-Origin", "*");
//            response.setStatus(302);
//            response.sendRedirect("/api/user/login");
//            response.setHeader("REDIRECT", "REDIRECT");
//            response.setHeader("CONTEXTPATH", "/login");
            return false;
        }
        return true;
    }

}
