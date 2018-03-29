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
	private ClientDao clientDao;
	
	
	private ClientDto clientDto;
	private BankAccountDto bankAccountDto;
	private TradeLogDto tradeLogDto;
	
	
	@RequestMapping("/inquireTotal")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTotal");
		String user_id = "test";

		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		return new ModelAndView("client/inquireTotal");
	}

	@RequestMapping("/inquireTransfer")
	public ModelAndView inquireTransfer(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransfer");
		String user_id = "test";

		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		
		/*String user_id = "id";
		BankAccountDto accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);

		
		List<TradeLogDto> tradeLogList = clientDao.tradeLogList(tradeLogDto);
		request.setAttribute("tradeLogList", tradeLogList);*/
		
		return new ModelAndView("client/inquireTransfer");
	}

	@RequestMapping("/deposit")
	public ModelAndView viewBm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView("client/deposit");
	}
	
	

}
