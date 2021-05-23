package com.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

//양방향 암호화를 지원하는 클래스
public class AESCryptor {
	private static SecretKey key; //암호화를 위한 키
	private String path;	//파일로 저장된 암호화키의 위치
	
	public AESCryptor() {
		//클래스가 인스턴스화 될 때 기본 설정을 해줘야함
		//1. key 파일이 있으면 key파일에서 secretkey 객체를 불러오고
		//없으면 secret객체를 생성하여 파일로 저장
		this.path=AESCryptor.class.getResource("/").getPath();
		this.path=this.path.substring(0,this.path.indexOf("classes"));
		System.out.println(path);
		File f = new File(this.path+"/secretKey.txt");		//파일로 저장하기
		if(f.exists()) {
			//key를 저장하는 파일이 있으면?
			try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f))){
				
				this.key=(SecretKey)ois.readObject();
			}catch(IOException | ClassNotFoundException e) {
				e.printStackTrace();
			}
		}else {
			//없으면
			//secretkey를 생성
			if(key==null) {
				getGenerator();	//key값을 생성하는 메소드
			}
		}
	} //생성자닫기

	private void getGenerator() {
		//secretkey를 생성하는 메소드
		SecureRandom ser = new SecureRandom();
		//key를 생성해주는 클래스
		KeyGenerator keygen=null;
		try {
			//키 생성을 위한 기본값 세팅하기
			//1. 적용할 알고리즘 AES=>키가 1개 / RSA=>키가 2개(공개키 / 개인키)
			keygen=KeyGenerator.getInstance("AES");
			//키값 생성 초기화 / 비트값 & 소트값
			keygen.init(128,ser);
			this.key=keygen.generateKey();
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//생성된 키 객체를 정해진 경로에 파일로 저장하자 
		File f =new File(this.path+"/secretKey.txt");
		try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f))) {
			oos.writeObject(this.key);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//암호화처리하기
	public static String encrypt(String str) throws NoSuchAlgorithmException, NoSuchPaddingException,
	InvalidKeyException,BadPaddingException, IllegalBlockSizeException{
		
		//key를 가지고 암호화 처리하는 클래스가 있음
		Cipher cipher= Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, AESCryptor.key);
		//매개변수로 넘어온 값 암호화처리하기
		byte[] encrypt=str.getBytes(Charset.forName("utf-8"));
		byte[] result=cipher.doFinal(encrypt);
		String resultValue=Base64.getEncoder().encodeToString(result);
		
		return resultValue;
	}

	//생성된 키 복호화처리하기
	public static String decrypt(String encryptedStr) throws NoSuchAlgorithmException, NoSuchPaddingException,
	InvalidKeyException,BadPaddingException, IllegalBlockSizeException{
		
		//key를 가지고 암호화 처리하는 클래스가 있음
		Cipher cipher= Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, AESCryptor.key);
		//매개변수로 넘어온 값 암호화처리하기
		byte[] decodeStr=Base64.getDecoder().decode(encryptedStr.getBytes(Charset.forName("utf-8")));
		byte[] oriVal=cipher.doFinal(decodeStr);	//복호화된것
		
		return new String(oriVal);
	}
}
