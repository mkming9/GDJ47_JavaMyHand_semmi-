package com.jmh.donate.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;
import com.jmh.donate.model.vo.News;

/**
 * Servlet implementation class DonateNewsServlet
 */
@WebServlet("/donate/donateNews.do")
public class DonateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonateNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="https://search.naver.com/search.naver?where=news&query=우크라이나+후원";
		Document doc=Jsoup.connect(url).get();
		
		List<News> news=new ArrayList();
		
		// 뉴스 제목가져오기
		Elements nameElements=doc.getElementsByAttributeValue("class", "news_tit");
		Elements aElements=nameElements.select("a");
		// System.out.println(aElements);
		
		Elements imgElements=doc.getElementsByAttributeValue("class", "dsc_thumb");
		Elements imgs=imgElements.select("img");
		
		for(int i=0; i<8; i++) {
			Element e = aElements.get(i);
			Element eimg = imgs.get(i);
			String newsTitle=e.attr("title");
			String newsLink=e.attr("href");
			String imgLink=eimg.attr("src");
			
			System.out.println((i+1)+". 제목 : "+newsTitle+", 링크 : " + newsLink+", 사진링크 : "+imgLink);
			
			News n =News.builder().title(newsTitle).link(newsLink).img(imgLink).build();
			
			news.add(n);
		}
		
		Gson gson=new Gson();
		
		response.setContentType("application/json;charset=utf-8");
		gson.toJson(news, response.getWriter());
		
		System.out.println(news);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
