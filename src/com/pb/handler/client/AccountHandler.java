package com.pb.handler.client;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pb.client.AccountDao;
import com.pb.client.ClientDto;

@Controller
public class AccountHandler {
	@Resource
	AccountDao accountDao;

	@RequestMapping(value="signup", method=RequestMethod.GET)
	public ModelAndView signupForm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return new ModelAndView("client/signup");
	}
	
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public ModelAndView signupPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String addr_detail = request.getParameter("addr_detail");
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String email = request.getParameter("email");
		String job = request.getParameter("job");
		if("etc".equals(request.getParameter("job"))) {
			job = request.getParameter("etc_value");
		}
		
		String gender = request.getParameter("gender");
		
		ClientDto client = new ClientDto(id, password, name, addr, addr_detail, phone, email, job, gender);
		int result = accountDao.addAccount(client);
		if(result != 1) {
			return new ModelAndView("client/signup");
		}
		
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="searchAddr")
	public ModelAndView searchAddr(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return new ModelAndView("client/addr");
	}
	
	@RequestMapping(value="signin", method=RequestMethod.GET)
	public ModelAndView signinForm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return new ModelAndView("client/signin");
	}
	
	@RequestMapping(value="signin", method=RequestMethod.POST)
	public ModelAndView signinPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		ClientDto client = new ClientDto(id, password);
		int result = accountDao.checkByIdAndPw(client);
		
		switch(result) {
		case -1:
			request.setAttribute("result", "아이디나 비밀번호가 틀렸습니다.");
			return new ModelAndView("client/signin");
		case 0:
			request.setAttribute("result", "아이디나 비밀번호가 틀렸습니다.");
			return new ModelAndView("client/signin");
		case 1:
			ClientDto getClient = accountDao.findById(client);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("userId", getClient.getId());
			httpSession.setAttribute("userName", getClient.getName());
			break;
		}
		
		return new ModelAndView("index");
	}
	
	@RequestMapping(value="checkIdDup")
	public ModelAndView checkIdDup(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
		ClientDto client = new ClientDto(id);
		ClientDto result = accountDao.findById(client);
		
		if(result == null) {
			request.setAttribute("result", true);
		} else {
			request.setAttribute("result", false);
		}
		
		return new ModelAndView("client/checkIdDup");
	}
	
	@RequestMapping(value="signout")
	public ModelAndView signout(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("userId");
		httpSession.removeAttribute("userName");
		return new ModelAndView("index");
	}

}
