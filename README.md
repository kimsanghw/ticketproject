# 🎟️ TicketProject — 공연 예매 및 관리 시스템

## 📑 목차 (README ToC)


- [📅 프로젝트 개요](#-프로젝트-개요)
- [🧩 기획 의도 및 목적](#-기획-의도-및-목적)
- [👥 팀 소개](#-팀-소개)
- [⚙️ 개발 환경 및 기술 스택](#️-개발-환경-및-기술-스택)
- [📆 개발 일정](#-개발-일정)
- [🧭 서비스 구성도](#-서비스-구성도)
- [🧩 주요 기능 요약](#-주요-기능-요약)
- [🗂️ 프로젝트 디렉토리 구조](#️-프로젝트-디렉토리-구조)
- [🔒 시스템 아키텍처](#-시스템-아키텍처)
- [🖥 주요 JSP 페이지](#-주요-jsp-페이지)
- [📫 API 연동 요약](#-api-연동-요약)
- [✅ 핵심 포인트 요약](#-핵심-포인트-요약)
- [🔄 KOPIS 공연 데이터 자동 업데이트 — 자세한 흐름](#-kopis-공연-데이터-자동-업데이트--자세한-흐름)
    
---

## 📅 프로젝트 개요
> **공공데이터 기반 공연 예매·관리 통합 플랫폼**

**TicketProject**는 KOPIS(공연예술통합전산망)의 공연 데이터를 기반으로  
사용자에게 **공연 조회 → 예매 → 결제 → 리뷰 작성**까지  
모든 과정을 한 번에 제공하는 공연 예매 및 관리 시스템입니다.

---

## 🧩 기획 의도 및 목적

### 🎯 기획 의도
- 공공데이터(OpenAPI)를 활용하여 **실제 공연 데이터를 반영한 실시간 예매 서비스 제공**
- 공연 관련 정보를 종합 제공하여 사용자 접근성 향상

### 🧭 프로젝트 목적
- **Spring MVC + MyBatis** 기반의 모듈화된 구조로 유지보수성과 확장성 확보  
- **Spring Security**를 통한 권한 관리 및 접근 제어 구현  
- **Spring Scheduler**로 공연 데이터 자동 갱신  
- 실무형 협업 및 문서화 능력 향상을 목표로 함  

---

## 👥 팀 소개

| 역할 | 주요 담당 |
|------|------------|
| 💼 **팀장 김상화** | UML 전반 작성, 공지사항 프로토타입 및 발표자료 제작, 공지·리뷰·신고·관리자·메인 기능 구현 |
| 🧠 **팀원 백승우** | HTML 프로토타입 작성, 요구사항 및 제안서 작성, 공연 관리 및 예매 기능 구현 |
| 🧾 **팀원 권진완** | 문서 종합 및 ERD 작성, DB 구축, 시큐리티 설정, 회원가입/로그인/결제/마이페이지 구현 |

---

## ⚙️ 개발 환경 및 기술 스택

| 구분 | 내용 |
|------|------|
| **개발 환경** | Apache Tomcat 9.0 / Oracle MySQL 8.0 / Oracle JDK 13.0.2 / GitHub |
| **개발 도구** | Spring 4 / StarUML 6.2.2 / VSCode |
| **기술 스택** | HTML5 / CSS3 / JavaScript / JSP / MyBatis / Spring Security / Spring Scheduler / JSTL / JavaMailSender |

---

## 📆 개발 일정

| 단계 | 기간 |
|------|------|
| 프로젝트 기획 | ~ 24.11.28 |
| 요구사항 분석 | ~ 24.12.03 |
| 시스템 설계 | ~ 24.12.05 |
| 화면 설계 및 구현 | ~ 24.12.10 |
| **개발 기간** | **24.12.10 ~ 24.12.31** |

---

## 🧭 서비스 구성도

![서비스 구성도](https://github.com/kimsanghw/ticketproject/blob/main/ppt/service-structure.png)

### 기능 요약
- **로그인 / 회원가입** → 일반 사용자, 공연장 사용자 구분  
- **공연 관리** → 공연 등록, 수정, 삭제 (공연장 전용)  
- **예매 관리** → 공연 예매 및 결제, 좌석 확인  
- **리뷰 관리** → 리뷰 작성·수정·삭제·신고  
- **관리자 페이지** → 공연장 승인, 신고 처리, 공지사항 관리  
- **공지사항 게시판** → CRUD 기능  

---

## 🧩 주요 기능 요약

| 구분 | 기능명 | 설명 |
|------|---------|------|
| **회원관리** | 회원가입 / 로그인 / 이메일 인증 | 일반회원·공연장회원 구분 가입 / 이메일 인증번호 발송 |
| **공연관리** | 공연 등록·수정·삭제 | 공연장 회원 전용 관리 페이지 |
| **예매시스템** | 예매 / 좌석 확인 | 날짜·회차별 예매 가능, 잔여좌석 실시간 확인 |
| **결제시스템** | KakaoPay 연동 | 결제 승인·취소 처리 |
| **리뷰/신고** | 리뷰 CRUD 및 신고 기능 | 공연별 후기 작성 및 관리자 검토 |
| **공지사항** | CRUD | 관리자 전용 게시판 |
| **자동 스케줄러** | KOPIS API 자동 갱신 | 최신 공연 정보 자동 업데이트 |
| **보안/권한** | Spring Security | 관리자·공연장·일반 사용자별 접근 제어 |

---

## 🗂️ 프로젝트 디렉토리 구조

```plaintext
ticketproject/
├── src/main/java/com/ticketproject/
│   ├── controller/
│   │   ├── AdminController.java
│   │   ├── HomeController.java
│   │   ├── MyController.java
│   │   ├── NoticeController.java
│   │   ├── PaymentController.java
│   │   ├── PerformanceController.java
│   │   ├── PerformanceMyController.java
│   │   ├── ReportController.java
│   │   ├── ReservationController.java
│   │   ├── ReviewController.java
│   │   └── UserController.java
│   │
│   ├── dao/
│   │   ├── AdminDAO.java
│   │   ├── MyDAO.java
│   │   ├── NoticeDAO.java
│   │   ├── PaymentDAO.java
│   │   ├── PerformanceDAO.java
│   │   ├── PrfImgDAO.java
│   │   ├── ReportDAO.java
│   │   ├── ReservationDAO.java
│   │   ├── ReviewDAO.java
│   │   ├── RprfDAO.java
│   │   └── UserDAO.java
│   │
│   ├── service/
│   │   ├── AdminService(+Impl)
│   │   ├── EmailService(+Impl)
│   │   ├── MyService(+Impl)
│   │   ├── NoticeService(+Impl)
│   │   ├── PaymentService(+Impl)
│   │   ├── PerformanceService(+Impl)
│   │   ├── PrfImgService(+Impl)
│   │   ├── ReportService(+Impl)
│   │   ├── ReservationService(+Impl)
│   │   ├── ReviewService(+Impl)
│   │   ├── RprfService(+Impl)
│   │   ├── UserAuthenticationService.java
│   │   └── UserService(+Impl)
│   │
│   ├── scheduler/
│   │   └── ApiScheduler.java
│   │
│   ├── config/
│   │   └── MailConfig.java
│   │
│   ├── util/
│   │   ├── PagingUtil.java
│   │   ├── SessionUtils.java
│   │   └── VerificationCodeGenerator.java
│   │
│   └── vo/
│       ├── ApproveResponse.java
│       ├── HallVO.java
│       ├── KakaoPayReadyVO.java
│       ├── LoginUserVO.java
│       ├── NoticeVO.java
│       ├── OrderCreateForm.java
│       ├── PaymentVO.java
│       ├── PerformanceVO.java
│       ├── PrfImgVO.java
│       ├── ReadyResponse.java
│       ├── ReportVO.java
│       ├── ReservationVO.java
│       ├── ReviewVO.java
│       ├── RprfVO.java
│       ├── SearchVO.java
│       └── UserVO.java
│
├── src/main/resources/
│   ├── mappers/
│   │   ├── HallMapper.xml
│   │   ├── MyMapper.xml
│   │   ├── NoticeMapper.xml
│   │   ├── PaymentMapper.xml
│   │   ├── PerformanceMapper.xml
│   │   ├── PrfImgMapper.xml
│   │   ├── ReportMapper.xml
│   │   ├── ReservationMapper.xml
│   │   ├── ReviewMapper.xml
│   │   ├── RprfMapper.xml
│   │   └── UserMapper.xml
│   ├── email-context.xml
│   ├── log4j.xml
│   └── mybatis_config.xml
│
└── src/main/webapp/
    ├── resources/
    │   ├── img/
    │   ├── js/
    │   └── upload/
    ├── WEB-INF/views/
    │   ├── include/
    │   │   ├── header.jsp
    │   │   └── footer.jsp
    │   ├── adminpage/
    │   │   └── adminPage.jsp
    │   ├── mypage/
    │   │   ├── mypage.jsp
    │   │   ├── mypageModify.jsp
    │   │   └── performanceMypage.jsp
    │   ├── notice/
    │   │   ├── noticeList.jsp
    │   │   ├── noticeView.jsp
    │   │   ├── noticeWrite.jsp
    │   │   └── noticeModify.jsp
    │   ├── performance/
    │   │   ├── performance_write.jsp
    │   │   ├── performance_modify.jsp
    │   │   ├── performance_view.jsp
    │   │   ├── declaration.jsp
    │   │   └── performance_check.jsp
    │   ├── reservation/
    │   │   ├── ticket_check.jsp
    │   │   └── payment.jsp
    │   ├── user/
    │   │   ├── join.jsp
    │   │   └── login.jsp
    │   └── home.jsp
    ├── web.xml
    └── pom.xml

```
---

## 🔒 시스템 아키텍처
- **Spring MVC 3-Tier 구조
  Controller → Service → DAO → MyBatis Mapper → DB**
- **Spring Scheduler : KOPIS API 자동 갱신**
- **Spring Security : 사용자 권한(Role)별 접근 제어**
- **JavaMailSender + email-context.xml : 이메일 인증 처리**
- **KakaoPay API 연동 : 결제 승인 및 취소 처리**


---

## 🖥 주요 JSP 페이지

| 카테고리         | 파일명                                   | 주요 기능                   |
| ------------ | ------------------------------------- | ----------------------- |
| **메인**       | `home.jsp`                            | 공연 리스트, 최신 공연, “더보기” 버튼 |
| **공연관리**     | `performance_write.jsp`               | 공연 등록, 날짜 선택, 회차 등록     |
|              | `performance_modify.jsp`              | 공연 수정                   |
|              | `performance_view.jsp`                | 공연 상세 조회                |
| **예매/결제**    | `ticket_check.jsp`, `payment.jsp`     | 예매 및 KakaoPay 결제        |
| **회원/보안**    | `join.jsp`, `login.jsp`               | 가입 및 로그인, 이메일 인증        |
| **마이페이지**    | `mypage.jsp`, `performanceMypage.jsp` | 예매내역, 공연 관리             |
| **공지사항/관리자** | `noticeList.jsp`, `adminPage.jsp`     | 공지사항 CRUD, 신고 처리        |


---

## 📫 API 연동 요약

| API                                    | 역할               |
| -------------------------------------- | ---------------- |
| **KOPIS API**                          | 공연 정보 자동 수집      |
| **KakaoPay API**                       | 결제 승인 및 결제 정보 수신 |
| **JavaMailSender (email-context.xml)** | 이메일 인증번호 발송      |

---

## ✅ 핵심 포인트 요약
- 완성형 Spring MVC 구조 (Controller → Service → DAO → Mapper)
- KOPIS 공연 데이터 자동 업데이트 (Scheduler)
- KakaoPay 결제 + JavaMail 이메일 인증 연동
- Spring Security 기반 권한별 접근 제어


---
## 🔄 KOPIS 공연 데이터 자동 업데이트 — 자세한 흐름

스케줄러 모듈은 **데이터 수집 트리거(스케줄)**, **1차 목록 수집/저장**, **2차 상세 수집/업데이트**, **이미지(styurl) 저장**으로 구성됩니다.  
구현은 `ApiScheduler → PerformanceService(+Impl) → PerformanceDAO/PrfImgDAO → MyBatis Mapper(XML)` 순서로 동작합니다.

---

### 1) 데이터 수집 트리거 (스케줄)

- **클래스**: `com.ticketproject.scheduler.ApiScheduler`  
- **메서드**: `apiScheduler()`  
- **Cron**: `0 0 12 1/1 *  *` *(초 분 시 일 월 요일 연도)*  
- **목적**: 기준일 **±15일** 기간으로 1차 목록 수집 → 저장 후, DB에 적재된 `mt20id` 전부에 대해 **상세 API** 추가 조회/업데이트

```java
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
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/xml");

        SAXBuilder builder = new SAXBuilder();
       
        Document document = builder.build(conn.getInputStream());
        
        Element root = document.getRootElement();
       
        List<Element> dbElements = root.getChildren("db");
       
        
        

        List<PerformanceVO> performanceList = new ArrayList<PerformanceVO>();
        List<PrfImgVO> prfimgList = new ArrayList<PrfImgVO>();
        List<String> mt20ids = performanceService.selectMt20id();

        for (Element dbElement : dbElements) {
        	
            PerformanceVO performance = new PerformanceVO();
            performance.setMt20id(dbElement.getChildText("mt20id"));
            performance.setPrfnm(dbElement.getChildText("prfnm"));
            performanceList.add(performance);
           

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
```

### 2) 1차 수집 — 공연 목록(요약) → 저장

- **요청 URL(예시)**
  
	`GET http://www.kopis.or.kr/openApi/restful/pblprfr?service=...&stdate=yyyyMMdd&eddate=yyyyMMdd&cpage=1&rows=48&fcltychartr=4&shcate=AAAA`


- **파싱**  
	- **XML 응답의 `<db>` 목록을 **JDOM2**로 파싱하여 **`mt20id`, `prfnm`, `poster`** 추출**

- **저장 흐름**  
	1. `PerformanceVO(mt20id, prfnm)` 리스트 구성  
	2. `PrfImgVO(poster, prfid)` 리스트 구성 *(포스터 URL)*  
	3. `performanceService.savePerformanceAndImages(list1, list2)` 호출

- **Service/DAO 핵심 시그니처**
```java
// Service
void savePerformanceAndImages(List<PerformanceVO> performances, List<PrfImgVO> prfimgs);
```
```sql
<!-- Mapper (namespace = com.ticketproject.mapper.PerformanceMapper) -->
<select id="selectPerformanceByMt20id" parameterType="String" resultType="PerformanceVO">
  SELECT prfid, mt20id, prfnm
    FROM performance
   WHERE mt20id = #{mt20id}
</select>

<insert id="insertPerformance" parameterType="PerformanceVO" useGeneratedKeys="true" keyProperty="prfid">
  INSERT INTO performance (mt20id, prfnm)
  VALUES (#{mt20id}, #{prfnm})
</insert>
```
-**Service 구현**
```java
// com.ticketproject.service.PerformanceServiceImpl
@Transactional
public void savePerformanceAndImages(List<PerformanceVO> performanceList, List<PrfImgVO> prfimgList) {
    for (PerformanceVO performance : performanceList) {
        // 1) 공연 존재 여부 확인
        PerformanceVO existingPerformance =
            performanceDAO.selectPerformanceByMt20id(performance.getMt20id());

        int prfid;
        if (existingPerformance == null) {
            // 2) 신규면 INSERT (useGeneratedKeys=true 로 prfid 세팅)
            performanceDAO.insertPerformance(performance);
            prfid = performance.getPrfid();
        } else {
            // 3) 기존이면 prfid 재사용
            prfid = existingPerformance.getPrfid();
        }

        // 4) 포스터(PrfImg) 저장
        for (PrfImgVO prfimg : prfimgList) {
            // 현재 매칭 기준은 prfid. (빌드 시점/저장 시점 차이 주의)
            if (performance.getPrfid() == prfimg.getPrfid()) {
                prfimg.setPrfid(prfid);       // 정확한 FK 주입
                prfimgDAO.insertPrfimg(prfimg);
                break;
            }
        }
    }
}
```
동작 요약: mt20id로 공연 존재 여부 검사 → 없으면 INSERT 후 생성된 prfid로 포스터 저장.


