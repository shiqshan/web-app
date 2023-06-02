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
        System.out.println("preHandlepreHandle");
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // 如果用户未登录，则跳转到登录页面
//            response.sendRedirect("login");
//            response.sendRedirect(request.getContextPath()+"/login");
//            response.setHeader("REDIRECT", "REDIRECT");
//            response.setHeader("CONTEXTPATH", "/login");
//            response.setStatus(302);
            return false;
        }
        return true;
    }

}
