package com.jmh.common;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {

	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		String url="https://search.naver.com/search.naver?where=news&query=우크라이나+후원";
		Document doc=Jsoup.connect(url).get();
		
//		System.out.println(doc);
		
		// 뉴스 제목가져오기
		Elements nameElements=doc.getElementsByAttributeValue("class", "news_tit");
		Elements aElements=nameElements.select("a");
		for(Element e : aElements) {
			System.out.println(e);
		}
		String newsTitle=aElements.attr("title");
		String newsLink=aElements.attr("href");
		// System.out.println("제목 : " + newsTitle + " + 링크 : " + newsLink);
		
//		// 종목명
//		Elements nameElements=doc.getElementsByAttributeValue("class", "wrap_company");
//		Elements h2Elements=nameElements.select("h2");
//		System.out.println("종목명 : " + h2Elements.text());
//		
//		// 현재가
//		Elements e1=doc.getElementsByAttributeValue("class", "no_today");
//		Element e2=e1.get(0);
//		Elements e3=e2.select("span");
//		System.out.println("현재가 : " + e3.get(0).text());
//		
		System.out.println();
	}

}
