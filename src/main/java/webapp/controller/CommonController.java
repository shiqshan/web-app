package webapp.controller;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import webapp.common.RS;
import webapp.common.Result;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/api/common")
public class CommonController {
    @Value("${user.avatar.path}")
    private String path;

    @PostMapping("/upload")
    public Result uploadUserAvatar(MultipartFile file) {
        //原文件名
        String originalName = file.getOriginalFilename();
        String suffix = originalName.substring(originalName.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString() + suffix;

        //创建目录
        File dir = new File(path);
        //不存在 就创建
        if (!dir.exists()) {
            dir.mkdir();
        }
        try {
            file.transferTo(new File(path + fileName));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return RS.success((Object) fileName);
    }

    @GetMapping("/download")
    public void download(String fileName, HttpServletResponse response) {
        try {
            //输入流读取文件
            FileInputStream fileInputStream = new FileInputStream(new File(path + fileName));

            //输出流 将内容写回浏览器
            ServletOutputStream outputStream = response.getOutputStream();
            int length = 0;
            byte[] bytes = new byte[1024];

            while ((length = fileInputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, length);
                outputStream.flush();
            }
            //关闭资源
            outputStream.close();
            fileInputStream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
