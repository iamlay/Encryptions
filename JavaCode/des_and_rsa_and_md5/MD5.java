package com.coinvs.main.des_and_rsa_and_md5;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5 32位小写加密源码
 * @author 华
 *
 */
public class MD5 {
	/**
	 * 全局数组
	 */
    private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };
    public MD5() {
    }

    /**
     * 返回形式为数字和字符串
     * @param bByte
     * @return
     */
    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }
    /**
     *  转换字节数组为16进制字串
     * @param bByte
     * @return
     */
    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }
    
    /**
     * 将给定的字符串经过md5加密后返回
     * @param strObj
     * @return
     */
    public static String getMD5Str(String str) {
        String resultString = null;
        try {
        	//将给定字符串追加一个静态字符串，以提高复杂度
            resultString = new String(str);
            MessageDigest md = MessageDigest.getInstance("MD5");
            // md.digest() 该函数返回值为存放哈希值结果的byte数组
            resultString = byteToString(md.digest(resultString.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        return resultString;
    }
    public static void main(String[]args){
    	String time = "haha123456";
    	System.out.println("明文："+time);
    	String md5 = getMD5Str(time);
    	System.out.println("密文："+md5);
    }
}
