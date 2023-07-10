package webapp.common.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
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
            // 如果用户未登录，则告诉前端重定向
            response.setStatus(302);
            response.setHeader("Redirect", String.valueOf(true));
            response.setHeader("Contextpath", "/login");
            return false;
        }
        return true;
    }

}
