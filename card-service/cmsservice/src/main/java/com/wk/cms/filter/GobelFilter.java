package com.wk.cms.filter;


import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.stereotype.Component;
import sun.net.www.http.HttpClient;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.Month;

@Component
@ServletComponentScan
@WebFilter(urlPatterns = "/**",filterName = "loginFilter")
public class GobelFilter implements Filter {
    private static final Logger log = LoggerFactory.getLogger(GobelFilter.class);

    private static int year = 0;
    private static int month = 0;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.info("过虑器初始化");
//        String param = "";
//        StringBuffer sbf = new StringBuffer();
//        String u = "http://api.map.baidu.com/telematics/v3/weather?location=%E5%B9%BF%E5%B7%9E&output=json&ak=bMMc3G9Im5bbHA5tScTHi3hV1uhj1Cbr";
//        try {
//            URL url = new URL(u);
//            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//            connection.setDoInput(true);
//            connection.setDoOutput(true);
//            connection.setRequestMethod("POST");
//            connection.setUseCaches(false);
//            connection.setInstanceFollowRedirects(true);
//            // connection.addRequestProperty("role", "Admin");
//            connection.addRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//            connection.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
//            connection.connect();
//            DataOutputStream out = new DataOutputStream(connection.getOutputStream());
//            if (!"".equals(param)) {
//                // 正文，正文内容其实跟get的URL中 '? '后的参数字符串一致
//                //  String content = "字段名=" + URLEncoder.encode("字符串值", "编码");
//
//                out.writeBytes(param);
//            }
//            out.flush();
//            out.close();
//
//            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
//            String lines;
//            while ((lines = reader.readLine()) != null) {
//                lines = new String(lines.getBytes(), "utf-8");
//                sbf.append(lines);
//            }
////            System.out.println(sbf);
//            JSONObject jsonObject = (JSONObject)JSONObject.toJSON(sbf);
//            String date = (String)jsonObject.get("date");
//            String[] dates = date.split("-");
//            year = Integer.parseInt(dates[0]);
//            month = Integer.parseInt(dates[1]);
//            reader.close();
//            // 断开连接
//            connection.disconnect();
//        } catch (MalformedURLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        String a =  sbf.toString();
//        log.info("a="+a);
        LocalDate now = LocalDate.now();
        year = now.getYear();
        month = now.getMonthValue();

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {


        log.info("请求前过虑器执行>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ year + "-" + month);
        if(year>2018 && month>1){
            log.info("******************服务已经过期*******************");
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
        log.info("请求后过虑器执行<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

    }

    @Override
    public void destroy() {
        log.info("过虑器销毁");
    }
}