package site.exception.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;

public class FileUtil {
	
	/**
	 * 读取文件
	 * @param filePath 文件路径
	 * @return 文件内容字符串
	 */
	public static String readFile(String filePath) throws Exception {
		StringBuilder result = new StringBuilder();
		InputStreamReader isr = new InputStreamReader(new FileInputStream(filePath), "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		String line = null;
		while ((line = br.readLine()) != null) {
//			result.append(line + System.getProperty("line.separator"));
			result.append(line);
		}
		br.close();
		return result.toString();
	}
	
	/**
	 * 向文件中写入字符串
	 * @param filePath 文件路径
	 * @param content 写入内容
	 * @throws Exception
	 */
	public static void writeString2File(String filePath, String content) throws Exception {
		OutputStreamWriter osw = new OutputStreamWriter(
				new FileOutputStream(filePath), "UTF-8");
		osw.write(content);
		osw.flush();
		osw.close();
	}
	
//	public static void main(String[] args) {
//		try {
////			writeString2File("Q:/test.txt", "就是这样就是这样就是这样就是这样就是这样就是这样就是这样就这样就是这样就是这样就是这样就是这样就是这样就是这样就这样就是这样就是这样就是这样就是这样就是这样就是这样就是这样就是这样就是这样就是这样就是这样");
//			System.out.println("C:/opt/mds/1/2017-05-04/Android 小技巧之将 TextView 的文字竖直排列.md");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
}
