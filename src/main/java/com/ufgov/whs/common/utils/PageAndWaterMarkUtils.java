package com.ufgov.whs.common.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

public class PageAndWaterMarkUtils {/**
	 * 在pdf文件中添加水印
	 * 
	 * @param inputFile
	 *            原始文件
	 * @param outputFile
	 *            水印输出文件
	 * @param waterMarkName
	 *            水印名字
	 */
	private static int addWaterMarkPageNum2Pdf(String inputFile, String outputFile, int startPage, int totalPage) {
		int total = 0;
		try {
			PdfReader reader = new PdfReader(inputFile);
			PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(outputFile));

			// byte[] ownerName = "hello".getBytes();
			// byte[] ownerPassword = "12345".getBytes();
			stamper.setEncryption(null, null, PdfWriter.ALLOW_PRINTING, false);

			// stamper.setEncryption(null, null, PdfWriter.ALLOW_ASSEMBLY,
			// false);
			// stamper.setEncryption(null, null, PdfWriter.ALLOW_COPY, false);
			// stamper.setEncryption(null, null,
			// PdfWriter.ALLOW_DEGRADED_PRINTING, false);
			// stamper.setEncryption(null, null, PdfWriter.ALLOW_FILL_IN,
			// false);
			// stamper.setEncryption(null, null,
			// PdfWriter.ALLOW_MODIFY_ANNOTATIONS, false);
			// stamper.setEncryption(null, null,
			// PdfWriter.ALLOW_MODIFY_CONTENTS, false);
			// stamper.setEncryption(null, null, PdfWriter.ALLOW_PRINTING,
			// false);
			// stamper.setEncryption(null, null, PdfWriter.ALLOW_SCREENREADERS,
			// false);
			// stamper.setEncryption(null, null,
			// PdfWriter.DO_NOT_ENCRYPT_METADATA, false);
			// stamper.setViewerPreferences(PdfWriter.HideToolbar |
			// PdfWriter.HideMenubar);

			BaseFont base = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
			total = reader.getNumberOfPages() + 1;

			Rectangle mediaBox = reader.getPageSize(1);

			PdfContentByte under;
			int j = waterMarkName.length();
			char c = 0;
			int rise = 0;
			for (int i = 1; i < total; i++) {
				rise = 100;
				under = stamper.getUnderContent(i);
				under.beginText();
				under.setColorFill(BaseColor.LIGHT_GRAY);
				under.setFontAndSize(base, mediaBox.getTop() / 10);
				// 设置水印文字字体倾斜 开始
				under.setTextMatrix(mediaBox.getTop() / 10 + 10, 0);
				for (int k = 0; k < j; k++) {
					under.setTextRise(rise);
					c = waterMarkName.charAt(k);
					under.showText(c + "");
					rise += mediaBox.getRight() / 4;
				}

				under.endText();

				{
					PdfContentByte over = stamper.getOverContent(i);
					over.beginText();
					over.setColorFill(BaseColor.BLACK);
					over.setFontAndSize(base, 14);
					if (mediaBox.getTop() > mediaBox.getRight()) {
						over.setTextMatrix(mediaBox.getRight() - 135, 0);
						over.setTextRise(mediaBox.getTop() - 40);
						} else {
						over.setTextMatrix(mediaBox.getTop() - 135, 0);
						over.setTextRise(mediaBox.getRight() - 40);
					}
					//over.setTextMatrix(mediaBox.getRight() - 135, 0);

					over.setTextRise(mediaBox.getTop() - 40);
					over.showText("第 " + (i + startPage) + " 页 /共" + totalPage + " 页");

					over.endText();
				}
			}
			stamper.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return total - 1;
	}

	// 简单校验
	public static int getTotalPages(ArrayList<String> inputFiles) {
		int ret = 0;
		try {
			for (String elem : inputFiles) {
				//
				if (!elem.contains(".pdf")) {
					return 0;
				}

				//
				PdfReader reader = new PdfReader(elem);
				int tmp = reader.getNumberOfPages();
				if (tmp == 0) {
					return 0;
				}
				ret += tmp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	// 输出为处理后的文件列表
	public static Map<String, String> addWaterMarkPageNum2Pdf(ArrayList<String> inputFiles) {
		Map<String, String> outputFiles = new HashMap<String,String>();

		int total = getTotalPages(inputFiles);
		if (total == 0) {
			return outputFiles;
		}

		int n = 0;
		for (String elem : inputFiles) {
			String outFile = elem.replaceFirst("\\.pdf", "_PW.pdf");
			n += addWaterMarkPageNum2Pdf(elem, outFile, n, total);
			outputFiles.put(elem,outFile);
		}

		return outputFiles;
	}

	private static String waterMarkName = "中关村中支";

	public static void getPDFSize(String filename) throws IOException {
		PdfReader reader = new PdfReader(filename);
		System.out.println(filename);
		System.out.print("Number of pages: ");
		System.out.println(reader.getNumberOfPages());
		Rectangle mediabox = reader.getPageSize(1);
		System.out.print("Size of page 1: [");
		System.out.print(mediabox.getLeft());
		System.out.print(',');
		System.out.print(mediabox.getBottom());
		System.out.print(',');
		System.out.print(mediabox.getRight());
		System.out.print(',');
		System.out.print(mediabox.getTop());
		System.out.println("]");
		System.out.print("Rotation of page 1: ");
		System.out.println(reader.getPageRotation(1));
		System.out.print("Page size with rotation of page 1: ");
		System.out.println(reader.getPageSizeWithRotation(1));
		System.out.print("Is rebuilt? ");
		System.out.println(reader.isRebuilt());
		System.out.print("Is encrypted? ");
		System.out.println(reader.isEncrypted());
		System.out.println();
	}

	public static void main(String[] args) throws Exception {
		try {
			ArrayList<String> inputFiles = new ArrayList<String>();
			// inputFiles.add("E:\\JavaWorkSpace\\MyJavaTest\\MyTest.pdf");
			// inputFiles.add("E:\\JavaWorkSpace\\MyJavaTest\\MyTest2.pdf");

			inputFiles.add("E:\\PMP学习的主要内容.pdf");
			inputFiles.add("E:\\05 项目经理 人员资质证明材料.pdf");

			//
			// inputFiles.add("E:\\JavaWorkSpace\\MyJavaTest\\2010120715_pdf.pdf");
			addWaterMarkPageNum2Pdf(inputFiles);

			// getPDFSize("E:\\JavaWorkSpace\\MyJavaTest\\MyTestA3.pdf");
			// getPDFSize("E:\\JavaWorkSpace\\MyJavaTest\\MyTestA4.pdf");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
