package com.sust.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 防止交叉引用
 */
@Controller
public class ImageController {
	//日志省略---
	
	@RequestMapping(value="/get-image/{id}")
	public void getImage(@PathVariable String id, HttpServletRequest request, HttpServletResponse response,
	        @RequestHeader String referer) {
	    referer = "aa";
        if (referer != null) {
            String imageDirectory = request.getServletContext().
                    getRealPath("/WEB-INF/image");
            Path file = Paths.get(imageDirectory, id + ".jpg");
            if (Files.exists(file)) {
                response.setContentType("image/jpg");
                try {
                    Files.copy(file, response.getOutputStream());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
	}
}
