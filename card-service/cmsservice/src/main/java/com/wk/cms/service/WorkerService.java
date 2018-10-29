package com.wk.cms.service;

import com.wk.entity.Worker;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * 员工 服务接口
 */
public interface WorkerService {
	/**
	 * 增
	 * @param worker
	 * @return
	 */
	String add(Worker worker);

	/**
	 * 删
	 * @param id
	 * @return
	 */
	Integer delete(String id);

	/**
	 * 查
	 * @param id
	 * @return
	 */
	Worker get(String id);


	/**
     * 改
	 * @param worker
     * @return
     */
	Integer update(Worker worker);

    /**
     * 搜索
	 * @param worker
     * @return
     */
	List<Worker> search(Worker worker);

	Integer searchCount(Worker worker);

	//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

	/**
	 * 上传图片
	 * @param file  图片文件
	 * @param userId 操作上传的用户ID
	 * @param id 此员工的ID(可能为空，为空则会创建一个返回)
	 * @return 返回此员工ID,如果上传失败，则返回空字符串
	 */
	String uploadImg(MultipartFile file, String userId,String id) ;


}
