package com.sust.controller;

import com.sust.domain.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {
    //日志省略----
    @RequestMapping(value = "/input-product")
    public String inputProduct(Model model) {
        model.addAttribute("product", new Product());
        return "ProductForm";
    }

    /**
     * 文件上传
     *
     * @param request
     * @param product
     * @param model
     * @return
     */
    @RequestMapping(value = "/save-product")
    public String saveProduct(HttpServletRequest request, @ModelAttribute Product product, Model model) throws IOException {
        //获取上传文件
        List<MultipartFile> files = product.getImages();
        List<String> fileNames = new ArrayList<String>();
        if (files != null && files.size() > 0) { //文件有效性校验
            for (MultipartFile multipartFile : files) { //遍历所有上传文件
                //获取文件名称
                String filename = multipartFile.getOriginalFilename();
                System.out.println("文件名：" + filename);
                fileNames.add(filename);
                //获取当前运行文件在服务器上的绝对路径
                File imageFile = new File(request.getServletContext()
                        .getRealPath("/image"), filename);
                if(!imageFile.exists()){//如果路径不存在
                    imageFile.mkdirs();
                }
                System.out.println("绝对路径：" + imageFile);
                try {
                    //把文件从内存写入磁盘中
                    multipartFile.transferTo(imageFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            model.addAttribute("product", product);
            return "ProductDetails";
        }
        return "ProductForm";
    }
}
