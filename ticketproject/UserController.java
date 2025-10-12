package com.ticketproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ticketproject.service.EmailService;
import com.ticketproject.service.UserAuthenticationService;
import com.ticketproject.service.UserService;
import com.ticketproject.util.VerificationCodeGenerator;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.UserVO;


@Controller
public class UserController {

	@Autowired
	public UserService userService;
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private UserAuthenticationService userAuthenticationService;
	
	@RequestMapping(value="join/join.do", method=RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value="join/join.do",method=RequestMethod.POST)
	public String joinOk(UserVO userVO) {
		System.out.println(userVO.getUserid());
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
		
		// 비밀번호 암호화
	    String encodedPassword = epwe.encode(userVO.getUpassword());
	    userVO.setUpassword(encodedPassword);
	    
		int result =  userService.insert(userVO);
		
		if(result>0) {
			System.out.println("등록완료");
		} else {
			System.out.println("등록실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="join/sendVerificationCode.do",method=RequestMethod.POST)
	@ResponseBody
    public String sendVerificationCode(@RequestParam String email, HttpSession session) {
        try {
        	
        	int result = userService.findEmail(email);
        	System.out.println("result :" + result);
        	if(result>0) {
        		System.out.println("중복된 메일");
        		return "success";
        	} else {
        		System.out.println("else");
        		// 인증코드 생성
                String verificationCode = VerificationCodeGenerator.generateCode();
                //인증코드 세션에 저장
                session.setAttribute("verificationCode", verificationCode);
                // 이메일 전송
                emailService.sendVerificationEmail(email, verificationCode);
                
                return "fail";
        	} 
        	
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("예외 발생 :" + e.getMessage());
        }
        return "error ression:  code";
    }
	
	@RequestMapping(value="join/verifyCode.do", method=RequestMethod.POST, produces="application/json")
	@ResponseBody
	public Map<String, Boolean> verifyCode(@RequestParam String code, HttpSession session) {
	    Map<String, Boolean> response = new HashMap<>();
	    
	    String savedCode = (String) session.getAttribute("verificationCode");
	    response.put("isValid", savedCode != null && savedCode.equals(code));
	    
	    return response;
	}
	
	@RequestMapping(value="join/prfUserJoin.do", method=RequestMethod.POST)
	public String prfUserJoinOk(HallVO hallVO, String detailAddress, MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		//일반주소 + 상세주소를 해서 완벽한 주소라인을 만들기
		hallVO.setHalladdress(hallVO.getHalladdress() + " " + detailAddress);
		hallVO.setImg(file.getOriginalFilename());
		//비밀번호 암호화
		BCryptPasswordEncoder epwe = new BCryptPasswordEncoder();
	    String encodedPassword = epwe.encode(hallVO.getHpassword());
	    hallVO.setHpassword(encodedPassword);
	    //첨부파일 저장위치 설정
	    //상대경로로 저장되기 때문에 
	  //C:\Users\MYCOM\Documents\springWorkspace.metadata.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ticketProject\resources 해당 위치로 가서 사진을 upload폴더에 복사 붙여넣기 해야함
	    String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("upload path : " + path);
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs(); 
		}
		//첨부파일 이름대로 DB에 저장되야하는거 (원래이름, 변경이름) 
		if(!file.getOriginalFilename().isEmpty()) {
			
			UUID uuid = UUID.randomUUID();
			
			String fileRealName = uuid.toString()+file.getOriginalFilename();
			
			hallVO.setChgImg(fileRealName);
			file.transferTo(new File(path, fileRealName));
		}
	    
	    
		 
		int result =  userService.hallInsert(hallVO);
		
		if(result>0) {
			System.out.println("등록완료");
		} else {
			System.out.println("등록실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="login/login.do", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="join/checkid.do", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(String userid) {
		UserVO loggedUser = new UserVO();
		
		
		
		int result = userService.idCheck(userid);
		
		if(result>0) {
			return "duplicate";
		} else {
			return "available";
		}
		
	}
}
