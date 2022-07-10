package com.ez.launer.user.model;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SmsSender {
  public void certifySms(String hp, String randomCode) {
    String api_key = "NCS1LFF1TNIZYJGN";
    String api_secret = "GM8RKUTPFVO4KZNBII9YVYQIS9S7SUNS";
    Message coolsms = new Message(api_key, api_secret);
       
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", hp);
    params.put("from", "01045209785");
    params.put("type", "SMS");
    params.put("text", "Launer에서 발송된 인증번호"+randomCode);
    params.put("app_version", "test app 1.2");

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
}


