package com.pb.handler.client;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pb.client.BankAccountDto;
import com.pb.client.ClientDto;
import com.pb.client.ClientDao;
import com.pb.client.TradeLogDto;

@Controller
public class ClientHandler{
	
	@Resource
	private ClientDao pclientDao;
	
	
	private ClientDto clientDto;
	
	private BankAccountDto bankAccountDto;
	
	private TradeLogDto tradeLogDto;
	
	
	@RequestMapping("/inquireTotal")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		List<BankAccountDto> accountList = pclientDao.accountList(bankAccountDto);
		request.setAttribute("accountList", accountList);
		return new ModelAndView("pclient/inquireTotal");
	}

	@RequestMapping("/deposit")
	public ModelAndView viewBm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView("pclient/deposit");
	}
	
	

}
