package com.pb.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DefaultHandler implements CommandHandler {

	@RequestMapping("*")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("defaultHandler");
		
		request.setAttribute( "result", "처리할 수 없는 요청입니다" );
		return new ModelAndView("default");
	}

}
