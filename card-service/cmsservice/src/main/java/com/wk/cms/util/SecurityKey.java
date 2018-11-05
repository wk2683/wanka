package com.wk.cms.util;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.DESedeKeySpec;

public class SecurityKey {
	private String KeyPassword = null;
    /** 
     * DES algorithm 
     */
	public static final String DES = "DES";
	
    /** 
     * DESede algorithm 
     */
	public static final String DESede = "DESede";
	
	/**
	 * MD5 algorithm 
	 */
	public static final String MD5 = "MD5";
	
	/**
	 * 
	 *
	 */
	
	public SecurityKey(){
		
	}
	
	public void setKeyPassword(String keyPassword){
		this.KeyPassword = keyPassword;
	}
	
	public static SecretKey createKeyUsePassword(String keyPassword, String algorithm) throws SecurityException{
		if(algorithm == SecurityKey.DES){
			return createKeyWithDES(keyPassword);			
		} else if(algorithm == SecurityKey.DESede){
			return createKeyWithDESede(keyPassword);
		}
		
		return null;
	}
	public static SecretKey createKeyWithDES(String keyPassword) throws SecurityException{
		SecretKey key  = null;
		try{
			DESKeySpec ks = new DESKeySpec(StringToByte(keyPassword));
			SecretKeyFactory skf = SecretKeyFactory.getInstance(SecurityKey.DES);
			key = skf.generateSecret(ks);		
		} catch (Exception ex){
			throw new SecurityException(ex);
		} 
		return key;
	}
	public static SecretKey createKeyWithDESede(String keyPassword) throws SecurityException{
		SecretKey key  = null;
		try{
			DESedeKeySpec ks = new DESedeKeySpec(StringToByte(keyPassword));
			SecretKeyFactory skf = SecretKeyFactory.getInstance(SecurityKey.DESede);
			key = skf.generateSecret(ks);		
		} catch (Exception ex){
			throw new SecurityException(ex);
		} 
		return key;
	}
	
	/**
	 * 得到的密钥
	 * @param algorithm
	 * @return
	 * @throws SecurityException
	 */
	public SecretKey getKey(String algorithm) throws SecurityException{
		if(this.KeyPassword != null){
			return this.createKeyWithDES(KeyPassword);
		}
		return null;
	}



	/**
	 * 字符串到字节的转换
	 * @param str String
	 * @return byte[]
	 */
	private static byte[] StringToByte(String str){
		int len = str.length();
		byte[] b = new byte[len * 2];
		char[] ch = str.toCharArray();
		for(int i = 0 ; i < len; i++){
			int temp=(int)ch[i];
			b[2*i + 1] = new Integer(temp&0xff).byteValue();
			temp = temp >> 8;
			b[ 2*i ] = new Integer(temp&0xff).byteValue();
		}
		return b;
	}


	
}
