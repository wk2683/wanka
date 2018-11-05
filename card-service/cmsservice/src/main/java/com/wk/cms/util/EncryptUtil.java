package com.wk.cms.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;

import com.sun.mail.util.BASE64EncoderStream;

public class EncryptUtil {	
	public static final String accKeyPassword = "AccountPwd";
	
	/**
	 * 
	 * @param origin 原始文本
	 * @param algorithm 加密算法名称
	 * @return byte[] 加密后的字节 
	 */	
	public static byte[] encrypt(String origin,SecretKey key,String algorithm) throws SecurityException{
		byte[] cipherByte = null;
		try{
			if(key == null){
				 key = SecurityKey.createKeyUsePassword("BISYSTEM",algorithm);
			}
			SecureRandom sr = new SecureRandom();
			Cipher cipher = Cipher.getInstance( algorithm );
	        cipher.init(Cipher.ENCRYPT_MODE, key,sr);
	        cipherByte = cipher.doFinal( origin.getBytes());
		} catch (Exception ex){
			throw new SecurityException(ex);
		}
		return cipherByte;
	}
	
	/**
	 * 使用DES加密
	 * @param origin 原始文本
	 * @return byte[] 加密后的字节 
	 */
	public static byte[] encryptWithDES(String origin) throws SecurityException{
		return encrypt(origin,null,SecurityKey.DES);
	}
	
	/**
	 * 使用DESede加密
	 * @param origin 原始文本
	 * @return byte[] 加密后的字节
	 */
	public static byte[] encryptWithDESede(String origin) throws SecurityException{
		return encrypt(origin,null,SecurityKey.DES);
	}
	
	public static String encryptToString(String origin, String algorithm) throws SecurityException{
        return new String(BASE64EncoderStream.encode(encrypt(origin,null,algorithm)));        
	}
	
	public static String encryptToString(String origin,String KeyPassword,String algorithm) throws SecurityException{
        return new String(BASE64EncoderStream.encode(encrypt(origin,SecurityKey.createKeyUsePassword(KeyPassword,algorithm),algorithm)));        
	}
	
	public static String encryptToString(String origin,SecretKey deskey,String algorithm) throws SecurityException{
        return new String(BASE64EncoderStream.encode(encrypt(origin,deskey,algorithm)));        
	}	
	
	public static String encryptToStringWithDES(String origin) throws SecurityException{
		return encryptToString(origin,SecurityKey.DES);
	}
	
	public static String encryptToStringWithDES(String origin,String keyPassword) throws SecurityException{
		return encryptToString(origin,keyPassword,SecurityKey.DES);
	}
	
	public static String encryptToStringWithDES(String origin,SecretKey deskey) throws SecurityException{
		return encryptToString(origin,deskey,SecurityKey.DES);
	}	
	
	public static String encryptToStringWithDESede(String origin) throws SecurityException{
		return encryptToString(origin,SecurityKey.DES);
	}
	
	public static String encryptToStringWithMD5(String origin) throws SecurityException{
		if (origin == null || origin.length() == 0) {
			throw new SecurityException("String to encript cannot be null or zero length");
		}
		StringBuffer hexString = new StringBuffer();
		MessageDigest md = null;
		byte[] hash = null;
		try {
			md = MessageDigest.getInstance(SecurityKey.MD5);
			md.update(origin.getBytes());
			hash = md.digest();
		} catch (NoSuchAlgorithmException e) {
			throw new SecurityException(e.getMessage(),e);
		}
		for (int i = 0; i < hash.length; i++) {
			if ((0xff & hash[i]) < 0x10) {
				hexString.append("0" + Integer.toHexString((0xFF & hash[i])));
			}				
			else {
				hexString.append(Integer.toHexString(0xFF & hash[i]));
			}				
		}
		return hexString.toString();
	}

	public static String string2MD5(String inStr){
		MessageDigest md5 = null;
		try{
			md5 = MessageDigest.getInstance("MD5");
		}catch (Exception e){
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++){
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();

	}

//	public static  void main(String[] args){
//		String pwd = "123456";
//		String p = EncryptUtil.string2MD5(pwd);
//		System.out.println(p);
//	}
	
}