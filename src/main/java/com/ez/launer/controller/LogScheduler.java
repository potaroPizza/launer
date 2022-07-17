package com.ez.launer.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.ez.launer.user.model.UserService;

import lombok.RequiredArgsConstructor;

@Component
@Controller
@RequiredArgsConstructor
public class LogScheduler { 
	
	private final UserService userService;


	 @Scheduled(cron = "0 0 0/1 * * *") //1시간마다
	    public void readLogFile () throws IOException {
		 	String basePath = "C:\\logs\\accesslog\\accesslog-"; // 여기 수정해야될것같은데...! 
	    	Date d = new Date(); //오늘날짜
	        d = new Date(d.getTime()+(1000*60*60*24*-1)); //어제날짜
	        SimpleDateFormat yesterday = new SimpleDateFormat("yyyy-MM-dd");
	        
	        //accesslog 파일 찾아서 => 파일 정보 읽어서 => list에 저장
	        String filePath = basePath+ yesterday.format(d)+".0.log";
	        List<String> list = Files.readAllLines(Paths.get(filePath), StandardCharsets.UTF_8); //어제 날짜의 로그파일 읽어들임
	        System.out.println(list);
	        
	        //중복 아이디 XX
	        //list => set 옮기기
	        HashSet<String>set = new HashSet<>();
	        
	        for(int i = 0; i<list.size(); i++) {
	        	String[] temp = list.get(i).split("[=]");
	        	System.out.println(temp[0]+","+temp[1]);
	        	set.add(temp[1]);
	        }
	        System.out.println("최종 = "+set); 
	        
	        //today format
	        Date today = new Date();
        	String date = yesterday.format(today);
        	System.out.println("date = "+date);
	        
        	//set size 만큼 insert 쿼리 실행
        	int cnt =0;
	        Iterator<String> iter = set.iterator();
	        while(iter.hasNext()) {
	        	Map<String, Object> map = new HashMap<String, Object>();
	        	map.put("usersNo",iter.next());
	        	map.put("date", date);

	        	cnt = userService.insertToday(map);
	        }
	    }

	 //(cron = "0/10 * * * * *") 10초마다실행
		//(cron = "0 0 0 * * *") //매일 자정
	 //0 0 0/1 * * * 한시간마다

    
}
