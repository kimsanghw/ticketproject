# 🎟️ TicketProject — 공연 예매 및 관리 시스템

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

![서비스 구성도](https://github.com/kimsanghw/ticketproject/ppt/service-structure.png)

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

