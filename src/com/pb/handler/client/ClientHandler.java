package com.pb.handler.client;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pb.client.BankAccountDto;
import com.pb.client.ClientDao;
import com.pb.client.ClientDto;
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
		
		return new ModelAndView("client/inquireTransfer");
	}

	@RequestMapping("/inquireTransferResult")
	public ModelAndView inquireTransferResult(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransferResult");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String account_number = request.getParameter("account_number");
		String inquireContent = request.getParameter("inquireContent");
		String firstDate = request.getParameter("firstDate");
		String endDate = request.getParameter("endDate");
		

		map.put("account_number", account_number);
		map.put("inquireContent", inquireContent);
		map.put("firstDate", firstDate);
		map.put("endDate", endDate);
			
		List<TradeLogDto> tradeLogDto = clientDao.tradeLogList(map);
		request.setAttribute("tradeLogDto", tradeLogDto);
		
		return new ModelAndView("client/inquireTransferResult");
	}

	@RequestMapping("/transferIntegration")
	public ModelAndView transferIntegration(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransfer");
		String user_id = "test";

		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		
		return new ModelAndView("client/transferIntegration");
	}

	@RequestMapping("/transferIntegrationResult")
	public ModelAndView transferIntegrationResult(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransferResult");
		String user_id = "test";
		
		String account_number = request.getParameter("account_number");
		String otherBank = request.getParameter("otherBank");
		String otherBankAccountNumber = request.getParameter("otherBankAccountNumber");
		String money = request.getParameter("money");
		String pwd = request.getParameter("pwd");
		String outPutMoneyMemo = request.getParameter("outPutMoneyMemo");
		String inPutMoneyMemo = request.getParameter("inPutMoneyMemo");
		String name = request.getParameter("name");

		
		return new ModelAndView("client/transferIntegrationResult");
	}

	
	@RequestMapping("/deposit")
	public ModelAndView viewBm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView("client/deposit");
	}
	
	

}
