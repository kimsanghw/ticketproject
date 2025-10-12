package com.ticketproject.scheduler;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ticketproject.service.PerformanceService;
import com.ticketproject.service.PrfImgService;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;

@Component
public class ApiScheduler {
	
	

	@Autowired
	private PerformanceService performanceService;
	@Autowired
	private PrfImgService PrfImgService;
	
	@Scheduled(cron= "0 0 12 1/1 *  * ") //초 분 시 일 월 요일 연도
    public void apiScheduler() throws Exception {
		//공연 목록 요청 후 DB에 저장
    	System.out.println("스케줄러 실행됨");
    	//System.out.println("1q");
    	
    	// 현재 시간 계산
        LocalDateTime now = LocalDateTime.now();

        // 15일 전과 후의 날짜 계산
        LocalDateTime startDate = now.minus(15, ChronoUnit.DAYS);
        LocalDateTime endDate = now.plus(15, ChronoUnit.DAYS);

        // 날짜 형식 설정 (예: "yyyyMMdd")
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

        // 동적으로 날짜 생성
        String stdate = startDate.format(formatter);
        String eddate = endDate.format(formatter);

        StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
        urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + "=a78255aae24e4b758994653483598aef");
        urlBuilder.append("&" + URLEncoder.encode("stdate", "UTF-8") + "=" + URLEncoder.encode(stdate, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("eddate", "UTF-8") + "=" + URLEncoder.encode(eddate, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("cpage", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("rows", "UTF-8") + "=" + URLEncoder.encode("48", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("fcltychartr", "UTF-8") + "=" + URLEncoder.encode("4", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("shcate", "UTF-8") + "=" + URLEncoder.encode("AAAA", "UTF-8"));

        URL url = new URL(urlBuilder.toString());
        //System.out.println("1踰�"+url);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");

        SAXBuilder builder = new SAXBuilder();
        //System.out.println("1踰�"+builder);
        Document document = builder.build(conn.getInputStream());
        //System.out.println("2踰�"+document);
        Element root = document.getRootElement();
        //System.out.println("3踰�"+root);
        List<Element> dbElements = root.getChildren("db");
        //System.out.println("4踰�"+dbElements);
        
        

        List<PerformanceVO> performanceList = new ArrayList<PerformanceVO>();
        List<PrfImgVO> prfimgList = new ArrayList<PrfImgVO>();
        List<String> mt20ids = performanceService.selectMt20id();

        for (Element dbElement : dbElements) {
        	//System.out.println("5踰�"+dbElements);
            PerformanceVO performance = new PerformanceVO();
            performance.setMt20id(dbElement.getChildText("mt20id"));
            performance.setPrfnm(dbElement.getChildText("prfnm"));
            performanceList.add(performance);
            //System.out.println("6踰�"+ performanceList);

            PrfImgVO prfimg = new PrfImgVO();
            prfimg.setPoster(dbElement.getChildText("poster"));
            prfimg.setPrfid(performance.getPrfid());
            prfimgList.add(prfimg);
            //System.out.println("7번"+prfimgList);
            
            
        }
        performanceService.savePerformanceAndImages(performanceList, prfimgList);
        
        
        //여기서부터 공연 상세 정보 요청후 DB에 저장하기
        //DB에서 조회 해온 mt20id 전부 뽑기
        List<PerformanceVO> inDBList = performanceService.getAllmt20id();
        
        //공연 상세로 요청 보내기 mt20id는 저장되어 있으니 DB를 돌아서 아이디 전부 가져오고 
        for(PerformanceVO performance2 : inDBList) {
        	//System.out.println("mt20id 리스트 반복중..");
        	String mt20id = performance2.getMt20id();
        	StringBuilder urlBuilder2 = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr");
            urlBuilder2.append("/" +  mt20id);
            urlBuilder2.append("?" + URLEncoder.encode("service", "UTF-8") + "=a78255aae24e4b758994653483598aef");
            
            URL url2 = new URL(urlBuilder2.toString());
            HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
            conn2.setRequestMethod("GET");
            conn2.setRequestProperty("Content-type", "application/xml");
            //System.out.println(url2);
            SAXBuilder builder2 = new SAXBuilder();
            Document document2 = builder2.build(conn2.getInputStream());
            Element root2 = document2.getRootElement();
            List<Element> dbElements2 = root2.getChildren("db");
            //System.out.println("dbElements2 size : "+dbElements2.size());
            //System.out.println("요청완료");
            //여기위로 실행완료
            
            
            
            //가져온 공연상세 데이터를 퍼포먼스 각 칼럼에 저장
            Map<String, PerformanceVO> updatePrf = new HashMap<>();
            Map<String, PrfImgVO> updateImg = new HashMap<>(); 
            
            for (Element dbElement2 : dbElements2) {
                PerformanceVO performance = new PerformanceVO();
                performance.setMt20id(mt20id);
                performance.setPrfcast(dbElement2.getChildText("prfcast"));
                //System.out.println(dbElement2.getChildText("prfcast"));
                performance.setPrfcrew(dbElement2.getChildText("prfcrew"));
                //System.out.println(dbElement2.getChildText("prfcrew"));
                performance.setPrfruntime(dbElement2.getChildText("prfruntime"));
                //System.out.println(dbElement2.getChildText("prfruntime"));
                performance.setPcseguidance(dbElement2.getChildText("pcseguidance"));
                //System.out.println(dbElement2.getChildText("pcseguidance"));
                performance.setPrfpdfrom(dbElement2.getChildText("prfpdfrom"));
                //System.out.println(dbElement2.getChildText("prfpdfrom"));
                performance.setPrfpdto(dbElement2.getChildText("prfpdto"));
                //System.out.println(dbElement2.getChildText("prfpdto"));
                updatePrf.put(mt20id, performance);
                //System.out.println(updatePrf);
                performanceService.updatePrfInfo(updatePrf);
               
        
                PrfImgVO prfImg = new PrfImgVO();
                //styuri 분리 시켜야함 (4개 이상 있을경우 있음)
               Element styurlsElement = dbElement2.getChild("styurls");
               //System.out.println(dbElement2.getChild("styurls").getContentSize());
               if (styurlsElement != null) {
                   List<Element> styurlList = styurlsElement.getChildren("styurl");
                   for (int i = 0; i < styurlList.size(); i++) {
                       String styurlContent = styurlList.get(i).getText();
                       switch (i) {
                           case 0: prfImg.setStyuri1(styurlContent); break;
                           case 1: prfImg.setStyuri2(styurlContent); break;
                           case 2: prfImg.setStyuri3(styurlContent); break;
                           case 3: prfImg.setStyuri4(styurlContent); break;
                       }
                       updateImg.put(mt20id, prfImg);
                       PrfImgService.updateStyurl(updateImg);
                   }
               }
           }
            
            
        }
    }
}