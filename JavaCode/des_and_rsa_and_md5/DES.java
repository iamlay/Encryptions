package com.coinvs.main.des_and_rsa_and_md5;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class DES {
	public static final String PASSWORD_CRYPT_KEY = "12345678";
    private static byte[] iv = { 1, 2, 3, 4, 5, 6, 7, 8 };

    public static String encryptDES(String encryptString, String encryptKey)
            throws Exception {
        IvParameterSpec zeroIv = new IvParameterSpec(iv);
        SecretKeySpec key = new SecretKeySpec(encryptKey.getBytes(), "DES");
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key, zeroIv);
        byte[] encryptedData = cipher.doFinal(encryptString.getBytes());
        return Base64.encode(encryptedData);
    }
    
  public static String decryptDES(String decryptString, String decryptKey)
              throws Exception {
          byte[] byteMi = Base64.decode(decryptString);
          IvParameterSpec zeroIv = new IvParameterSpec(iv);
          SecretKeySpec key = new SecretKeySpec(decryptKey.getBytes(), "DES");
          Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
          cipher.init(Cipher.DECRYPT_MODE, key, zeroIv);
          byte decryptedData[] = cipher.doFinal(byteMi);
          return new String(decryptedData);
      }
  
  public static void main(String[]args) throws Exception{
	  String plaintext = "hahaGG123呵呵";
	    String ciphertext = DES.encryptDES(plaintext, DES.PASSWORD_CRYPT_KEY);
	    System.out.println("明文：" + plaintext);
	    System.out.println("密钥：" + DES.PASSWORD_CRYPT_KEY);
	    System.out.println("密文：" + ciphertext);
	    System.out.println("解密后：" + DES.decryptDES(ciphertext, DES.PASSWORD_CRYPT_KEY));
  }
}