package com.wk.cms.util;

import com.wk.cms.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

/**
 * 文件操作工具类
 */
public class FileUtil {

    private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
    /**
     * 上传文件
     * @param file 文件对象（spring 封装的文件对象）
     * @param basePath 保存文件的根目录（对各个模块而不同）
     * @param path2 根目录上多一级目录
     * @return 返回根目录以外的详细路径（包含文件名和后缀名）
     */
    public static String uploadImg(MultipartFile file,String basePath,  String path2) {
        String filePath = basePath + path2 +"/";
        logger.info("上传文件到：" + filePath);
        File workerSourcePathFile = new File(filePath);
        if(!workerSourcePathFile.exists()){
            workerSourcePathFile.mkdirs();
        }

        // 返回源文件名
        String originalName = file.getOriginalFilename();// 原文件名
        int lastIndex = originalName.lastIndexOf(".");

        // 上传后为防止文件名冲突及带中文会引起转换异常而新起的文件名
        String fileType = originalName.substring(lastIndex);// 包含"."
        fileType = fileType.toLowerCase();
        String newFileName = UUID.randomUUID().toString() + fileType;

        String saveFileFullName = filePath + newFileName;
        File saveFile = new File(saveFileFullName);//要保存的全路径文件对象

        try {
            file.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
        String path = path2 + "/" +newFileName;
        logger.info("上传文件完成 ，完整路径：" + filePath + path);

        return path;
    }
    /**
     * 读图片流返回，<img>标签直接显示
     * @param basePath  保存文件的根目录（对各个模块而不同）
     * @param path  除根目录外的详细地址（包含文件名和后缀名）
     * @param response servlet响应对象 ，用于返回文件流
     */
    public static void readImg(String basePath ,String path ,  HttpServletResponse response){

        String url = basePath + path;
        logger.info("读二进制文件：" + url);

        File file = new File(url);
        // 后缀名
        String suffixName = url.substring(url.lastIndexOf("."));
        String contentType = "image/jpeg;charset=utf-8";//jpg 、 jpeg
        if(suffixName.indexOf("png")>=0){
            contentType = "image/png;charset=utf-8";
        }

        FileInputStream inputStream = null;
        try {
            inputStream = new FileInputStream(file);
            byte[] data = new byte[(int) file.length()];
            int length = inputStream.read(data);
            inputStream.close();
            //setContentType("text/plain; charset=utf-8"); 文本
            response.setContentType(contentType);
            OutputStream stream = response.getOutputStream();
            stream.write(data);
            stream.flush();
            stream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
