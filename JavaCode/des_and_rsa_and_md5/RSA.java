package com.coinvs.main.des_and_rsa_and_md5;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
  
public final class RSA {  
	 private static final String DEFAULT_PUBLIC_KEY=
			 "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxuWhp6EgQfrrSBtxlBwbU35lhjC67X0Y1KrhqolIfYo3/yWV1eryYVUhk5xeHsbKg9RHD9TpIZRUWIW5a8MrMBcgr1A/dgIHi2EM28drH4JRTmkTLVHReggFbb046k0ISpLW3XVW0jHB3/z3S1c/NT9V63SQK6WJ65/YP5xISNQIDAQAB";
	 
	 private static final String DEFAULT_PRIVATE_KEY= 
    "MIICXQIBAAKBgQCxuWhp6EgQfrrSBtxlBwbU35lhjC67X0Y1KrhqolIfYo3/yWV1"+
    "eryYVUhk5xeHsbKg9RHD9TpIZRUWIW5a8MrMBcgr1A/dgIHi2EM28drH4JRTmkTL"+
    "VHReggFbb046k0ISpLW3XVW0jHB3/z3S1c/NT9V63SQK6WJ65/YP5xISNQIDAQAB"+
    "AoGARG7DALy7OvbBUuvnY1NQUxmCAuiqeeWWsBQyDIVSH9mgGdTfp1vKUNHN3WSK"+
    "T+qhgI6893pupb+eXfYjewrq2v4Oe0ZOEt0kaObuIVlHdejXiFT/h363iiIGeo8C"+
    "kE317disw7iAB7nb8E9lCQXj4CCA0KCjBKuJIbRYkRktVIECQQDfyqUjokYhrqfI"+
    "fyKnrKcH8cq6p+f+IssNbaSQlsx3XT+5yRqWJji/hC1rP6UXmHJQDqh/WSMzk9iv"+
    "GS7esgThAkEAy012aMCvMBYDLnQBOU0rQv85d0wCjLvxrucJV0jKGvp8EsvxUiEG"+
    "csqRnh0dl/EIW2dUM/rgQiZu4BBjljFj1QJBAKeWo7BZt1dF6hP1UUhrvPHwGjdJ"+
    "wivIdnLp5tD4fMnupOhGN4i1us2A+FpWYRWYbhKRx5EGeZwIXb5Sh4zxl0ECQGDr"+
    "Rda8fQf0hoG/xdGWa1heKfwoXVLQSnByLe7RgaAI59tiJGJd4iAZWABDqxcDTlOc"+
    "1/SL1htTDSp+RauVUh0CQQCRucUmNCCs11g7BpzyGvV5Uk79c5e0QhjQ6Oztc4fu"+
    "Sf5Iw6VPTNnyFxLc7xmB4jn38/RQYeZGuvSSTRVqFgIs";
	 
    /**  
     * 私钥  
     */    
    private static RSAPrivateKey privateKey;    
    
    /**  
     * 公钥  
     */    
    private static RSAPublicKey publicKey;    
        
    static{
    	//rsaEncrypt.genKeyPair();    
        //加载公钥    
        try {    
            loadPublicKey(RSA.DEFAULT_PUBLIC_KEY);    
            System.out.println("加载公钥成功");    
        } catch (Exception e) {    
            System.err.println(e.getMessage());    
            System.err.println("加载公钥失败");    
        }    
        //加载私钥    
        try {    
            loadPrivateKey(RSA.DEFAULT_PRIVATE_KEY);    
            System.out.println("加载私钥成功");    
        } catch (Exception e) {    
            System.err.println(e.getMessage());    
            System.err.println("加载私钥失败");    
        }    
    }
    /**  
     * 字节数据转字符串专用集合  
     */    
    private static final char[] HEX_CHAR= {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};    
        
    
    /**  
     * 获取私钥  
     * @return 当前的私钥对象  
     */    
    private static RSAPrivateKey getPrivateKey() {    
        return privateKey;    
    }    
    
    /**  
     * 获取公钥  
     * @return 当前的公钥对象  
     */    
    private static RSAPublicKey getPublicKey() {    
        return publicKey;    
    }    
    
    /**  
     * 随机生成密钥对  
     */    
    @SuppressWarnings("unused")
	private static void genKeyPair(){    
        KeyPairGenerator keyPairGen= null;    
        try {    
            keyPairGen= KeyPairGenerator.getInstance("RSA");    
        } catch (NoSuchAlgorithmException e) {    
            e.printStackTrace();    
        }    
        keyPairGen.initialize(1024, new SecureRandom());    
        KeyPair keyPair= keyPairGen.generateKeyPair();    
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();    
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        
        byte[] privateBytes = privateKey.getEncoded();
        BASE64Encoder encoder = new BASE64Encoder();
        String privateStr = encoder.encode(privateBytes);
        byte[] publicBytes= publicKey.getEncoded();
        String publicStr = encoder.encode(publicBytes);
        System.out.println("privateKey:"+privateStr);
        System.out.println("publicKey:"+publicStr);
    }    
    
    /**  
     * 从文件中输入流中加载公钥  
     * @param in 公钥输入流  
     * @throws Exception 加载公钥时产生的异常  
     */    
    @SuppressWarnings("unused")
	private  static void  loadPublicKey(InputStream in) throws Exception{    
        try {    
            BufferedReader br= new BufferedReader(new InputStreamReader(in));    
            String readLine= null;    
            StringBuilder sb= new StringBuilder();    
            while((readLine= br.readLine())!=null){    
                if(readLine.charAt(0)=='-'){    
                    continue;    
                }else{    
                    sb.append(readLine);    
                    sb.append('\r');    
                }    
            }    
            loadPublicKey(sb.toString());    
        } catch (IOException e) {    
            throw new Exception("公钥数据流读取错误");    
        } catch (NullPointerException e) {    
            throw new Exception("公钥输入流为空");    
        }    
    }    
    
    
    /**  
     * 从字符串中加载公钥  
     * @param publicKeyStr 公钥数据字符串  
     * @throws Exception 加载公钥时产生的异常  
     */    
    private static void loadPublicKey(String publicKeyStr) throws Exception{    
        try {    
            BASE64Decoder base64Decoder= new BASE64Decoder();    
            byte[] buffer= base64Decoder.decodeBuffer(publicKeyStr);  
            KeyFactory keyFactory= KeyFactory.getInstance("RSA");    
            X509EncodedKeySpec keySpec= new X509EncodedKeySpec(buffer);    
            publicKey= (RSAPublicKey) keyFactory.generatePublic(keySpec);    
        } catch (NoSuchAlgorithmException e) {    
            throw new Exception("无此算法");    
        } catch (InvalidKeySpecException e) {    
            throw new Exception("公钥非法");    
        } catch (IOException e) {    
            throw new Exception("公钥数据内容读取错误");    
        } catch (NullPointerException e) {    
            throw new Exception("公钥数据为空");    
        }    
    }    
    
    /**  
     * 从文件中加载私钥  
     * @param keyFileName 私钥文件名  
     * @return 是否成功  
     * @throws Exception   
     */    
    @SuppressWarnings("unused")
	private  static void loadPrivateKey(InputStream in) throws Exception{    
        try {    
            BufferedReader br= new BufferedReader(new InputStreamReader(in));    
            String readLine= null;    
            StringBuilder sb= new StringBuilder();    
            while((readLine= br.readLine())!=null){    
                if(readLine.charAt(0)=='-'){    
                    continue;    
                }else{    
                    sb.append(readLine);    
                    sb.append('\r');    
                }    
            }    
            loadPrivateKey(sb.toString());    
        } catch (IOException e) {    
            throw new Exception("私钥数据读取错误");    
        } catch (NullPointerException e) {    
            throw new Exception("私钥输入流为空");    
        }    
    }    
    
    private static void loadPrivateKey(String privateKeyStr) throws Exception{    
        try {    
            BASE64Decoder base64Decoder= new BASE64Decoder();    
            byte[] buffer= base64Decoder.decodeBuffer(privateKeyStr);    
            PKCS8EncodedKeySpec keySpec= new PKCS8EncodedKeySpec(buffer);    
            KeyFactory keyFactory= KeyFactory.getInstance("RSA");    
            privateKey= (RSAPrivateKey) keyFactory.generatePrivate(keySpec);    
        } catch (NoSuchAlgorithmException e) {    
            throw new Exception("无此算法");    
        } catch (InvalidKeySpecException e) {    
            e.printStackTrace();  
            throw new Exception("私钥非法");    
        } catch (IOException e) {    
            throw new Exception("私钥数据内容读取错误");    
        } catch (NullPointerException e) {    
            throw new Exception("私钥数据为空");    
        }    
    }    
    
    /**  
     * 公钥加密过程  
     * @param publicKey 公钥  
     * @param plainTextData 明文数据  
     * @return  
     * @throws Exception 加密过程中的异常信息  
     */    
    private static byte[] encrypt(RSAPublicKey publicKey, byte[] plainTextData) throws Exception{    
        if(publicKey== null){    
            throw new Exception("加密公钥为空, 请设置");    
        }    
        Cipher cipher= null;    
        try {    
            cipher= Cipher.getInstance("RSA");//, new BouncyCastleProvider());    
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);    
            byte[] output= cipher.doFinal(plainTextData);    
            return output;    
        } catch (NoSuchAlgorithmException e) {    
            throw new Exception("无此加密算法");    
        } catch (NoSuchPaddingException e) {    
            e.printStackTrace();    
            return null;    
        }catch (InvalidKeyException e) {    
            throw new Exception("加密公钥非法,请检查");    
        } catch (IllegalBlockSizeException e) {    
            throw new Exception("明文长度非法");    
        } catch (BadPaddingException e) {    
            throw new Exception("明文数据已损坏");    
        }    
    }    
   
    /**  
     * 私钥解密过程  
     * @param privateKey 私钥  
     * @param cipherData 密文数据  
     * @return 明文  
     * @throws Exception 解密过程中的异常信息  
     */    
    private static byte[] decrypt(RSAPrivateKey privateKey, byte[] cipherData) throws Exception{    
        if (privateKey== null){    
            throw new Exception("解密私钥为空, 请设置");    
        }    
        Cipher cipher= null;    
        try {    
            cipher= Cipher.getInstance("RSA");//, new BouncyCastleProvider());    
            cipher.init(Cipher.DECRYPT_MODE, privateKey);    
            byte[] output= cipher.doFinal(cipherData);    
            return output;    
        } catch (NoSuchAlgorithmException e) {    
            throw new Exception("无此解密算法");    
        } catch (NoSuchPaddingException e) {    
            e.printStackTrace();    
            return null;    
        }catch (InvalidKeyException e) {    
            throw new Exception("解密私钥非法,请检查");    
        } catch (IllegalBlockSizeException e) {    
            throw new Exception("密文长度非法");    
        } catch (BadPaddingException e) {    
            throw new Exception("密文数据已损坏");    
        }           
    }    
    
    /**  
     * 字节数据转十六进制字符串  
     * @param data 输入数据  
     * @return 十六进制内容  
     */    
    public static String byteArrayToString(byte[] data){    
        StringBuilder stringBuilder= new StringBuilder();    
        for (int i=0; i<data.length; i++){    
            //取出字节的高四位 作为索引得到相应的十六进制标识符 注意无符号右移    
            stringBuilder.append(HEX_CHAR[(data[i] & 0xf0)>>> 4]);    
            //取出字节的低四位 作为索引得到相应的十六进制标识符    
            stringBuilder.append(HEX_CHAR[(data[i] & 0x0f)]);    
            if (i<data.length-1){    
                stringBuilder.append(' ');    
            }    
        }    
        return stringBuilder.toString();    
    }    
    
    /**
     * decrypt String by Ras(sub) by privateKey
     * @return success:return decode original  
     */
    public static String decryptByPrivateKey(String ciphertext) throws Exception{
        try {
        	BASE64Decoder decoder = new BASE64Decoder();
	        byte[] cipher =  decoder.decodeBuffer(ciphertext);
	        byte[] plainText = decrypt(getPrivateKey(), cipher);
			return new String(plainText,"utf-8");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
    }
    
    /**
     * encrypt String by Ras(add)  by publicKey
     * @return success:return encrypt Base64 String  ;  fail:"fail"
     * @throws Exception 
     */
    public static String encryptByPublicKey(String plaintext) throws Exception{
         try {
        	 BASE64Encoder encoder = new BASE64Encoder();
        	 //encrypt process
        	 byte[] cipher = encrypt(getPublicKey(), plaintext.getBytes("utf-8"));    
        	 //byte[] to String by Base64 
			 return encoder.encode(cipher);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}  
    }
    
    public static void main(String[] args){    
    	//测试字符串    
        String encryptStr= "12345678";    
        try {    
        	
//        	System.out.println("=============公钥加密，私钥解密！===============");
//        	 //公钥加密
            System.out.println("明文："+encryptStr);
            long encryptstart = System.currentTimeMillis();
            String cipherStr = encryptByPublicKey(encryptStr);
            System.out.println("公钥加密密文："+cipherStr);
            long encryptend = System.currentTimeMillis();
            System.out.println("encrypt use time:"+(encryptend-encryptstart));
            System.out.println("============================");
            
            //私钥解密
            long decryptstart = System.currentTimeMillis();
            String plaineText = decryptByPrivateKey("nxiikreiYH1KPaEzuj6DEzlyDb+OrQ5dCjc0HsClxWxTjpHQ+QZJg2AN79Vm/763X2Yk0skafttLYDtvcbRhEsyNlU/7ZVjQ9Mqm+ufFbQFkHhSdsFoCPDdgjvBt85pNNz2K6uZae/3ykB99Ypc58qVR7NDfG9ktN9aKJ5xK8d4=");
        	System.out.println("解密："+plaineText);
        	long decryptend = System.currentTimeMillis();
        	System.out.println("decrypt use time:"+(decryptend-decryptstart));
        	 System.out.println("===========获取私钥公钥============");
             //genKeyPair();
        } catch (Exception e) {    
            System.err.println(e.getMessage());    
        }   
    }  
}  
