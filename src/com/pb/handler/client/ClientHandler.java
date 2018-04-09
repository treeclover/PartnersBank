package com.pb.handler.client;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pb.client.BankAccountDto;
import com.pb.client.ClientDao;
import com.pb.client.ClientDto;
import com.pb.client.OtherBankAccountDto;
import com.pb.client.TradeLogDto;

@Controller
public class ClientHandler{
	
	
	@Resource
	private ClientDao clientDao;
	
	
	private ClientDto clientDto;
	private BankAccountDto bankAccountDto;
	private OtherBankAccountDto otherBankAccountDto;
	private TradeLogDto tradeLogDto;
	
	
	@RequestMapping("/inquireTotal")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTotal");
		HttpSession httpSession = request.getSession();
		String user_id = (String) httpSession.getAttribute("userId");

		System.out.println(user_id);

		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		return new ModelAndView("client/inquireTotal");
	}


	@RequestMapping("/inquireTransfer")
	public ModelAndView inquireTransfer(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransfer");
		HttpSession httpSession = request.getSession();
		String user_id = (String) httpSession.getAttribute("userId");

		System.out.println(user_id);

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
		HttpSession httpSession = request.getSession();
		String user_id = (String) httpSession.getAttribute("userId");

		System.out.println(user_id);

		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		
		return new ModelAndView("client/transferIntegration");
	}

	/*@RequestMapping("/transferIntegrationChoice")
	public ModelAndView transferIntegrationChoice(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransfer");
		String user_id = "test";
		
		List<BankAccountDto> accountList = clientDao.accountList(user_id);
		request.setAttribute("accountList", accountList);
		
		return new ModelAndView("client/transferIntegrationChoice");
	}*/

	
	/*@RequestMapping("/transferIntegrationResult")
	public ModelAndView transferIntegrationResult(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransferResult");
		String user_id = "test";

		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();	
		
		
		String account_number = request.getParameter("account_number");
		String bankName = request.getParameter("bankName");
		String BankAccountNumber = request.getParameter("BankAccountNumber"); // 보낼 계좌 번호
		String money = request.getParameter("money"); 
		String pwd = request.getParameter("pwd");
		String outPutMoneyMemo = request.getParameter("outPutMoneyMemo");
		String inPutMoneyMemo = request.getParameter("inPutMoneyMemo");
		String name = request.getParameter("name");

		int check = clientDao.check(account_number, pwd);
		int otherAccountCheck = 0;
		
		 확인해야 할 것!
		 *  1. 계좌번호가 존재하는 것인지, 
		 *  2. 예금주 명이 같은지 
		 * 
		if(bankName.equals("PartnersBank")) {//partnersBank 은행으로 이체
			otherAccountCheck = clientDao.check(BankAccountNumber, pwd);  //0 이 나오면 계좌가 없는거
			
			if(otherAccountCheck != 0) {
				BankAccountDto accountDetail =clientDao.accountDetail(BankAccountNumber);
				request.setAttribute("accountDetail", accountDetail);
			}
			
		}else {//타 은행으로 이체
			System.out.println("타은행으로 이체");
			otherAccountCheck = clientDao.checkOtherBank(BankAccountNumber); //0이 나오면 계좌가 없는거
			
			if(otherAccountCheck != 0) {
				OtherBankAccountDto otherAccountDetail = clientDao.otherBankAccountDetail(BankAccountNumber);
				request.setAttribute("accountDetail", otherAccountDetail);
			}
		}
		
		request.setAttribute("check", check);
		
		request.setAttribute("account_number", account_number);
		request.setAttribute("bankName", bankName);
		request.setAttribute("BankAccountNumber", BankAccountNumber);
		request.setAttribute("money", money);
		request.setAttribute("outPutMoneyMemo", outPutMoneyMemo);
		request.setAttribute("inPutMoneyMemo", inPutMoneyMemo);
		request.setAttribute("name", name);
		
		
		return new ModelAndView("client/transferIntegrationResult");
	}*/
	
	
	@RequestMapping(value="/transferIntegrationResult", produces = "application/text; charset=utf8")
	@ResponseBody
	public String transferIntegrationResult(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("ClientHandler inquireTransferResult");
		String result = "";
		
		
		
		String account_number = request.getParameter("account_number");
		String bankName = request.getParameter("bankName");
		String BankAccountNumber = request.getParameter("BankAccountNumber"); // 보낼 계좌 번호
		int money = Integer.parseInt(request.getParameter("money")); 
		String pwd = request.getParameter("pwd");
		String outPutMoneyMemo = "";
		String inPutMoneyMemo = "";
		String name = "";
		
		if(request.getParameter("outPutMoneyMemo") != "")
			outPutMoneyMemo = request.getParameter("outPutMoneyMemo");
		if(request.getParameter("inPutMoneyMemo") != "")
			inPutMoneyMemo = request.getParameter("inPutMoneyMemo");
		if(request.getParameter("name") != "")
			name = request.getParameter("name");
		
		System.out.println(account_number +" : "+bankName+" : "+BankAccountNumber+" : "+money+" : "+pwd+" : "+outPutMoneyMemo+" : "+inPutMoneyMemo+" : "+name);
		
		int check = clientDao.check(account_number, pwd);
		int otherAccountCheck = 0;
		
		
		/* 확인해야 할 것!
		 *  1. 계좌번호가 존재하는 것인지,  O
		 *  2. 예금주 명이 같은지  --> jsp 파일에서 하기 
		 *  3. 이체금액이 잔액보다 작은지 확인 O
		 *  4. 출금계좌랑 입금계좌가 다른지 O
		 *  
		 * */
		
		
		/* 출금계좌랑 입금계좌가 다른지 */
		if( account_number.equals(BankAccountNumber)) {
			System.out.println("notMatch");
			result ="notMatch";
			return result;
		}
		
		/* 타 은행으로 보내는지 아닌지*/
		if(bankName.equals("PartnersBank")) {//partnersBank 은행으로 이체
			otherAccountCheck = clientDao.checkBank(BankAccountNumber);  //이체할 계좌 정보확인 0 이 나오면 계좌가 없는거
			
			if(otherAccountCheck != 0) {
				BankAccountDto accountDetail =clientDao.accountDetail(BankAccountNumber);
				
				System.out.println("accountDetail.getRemain_money() : "+accountDetail.getRemain_money());
				System.out.println("accountDetail.getName() : "+accountDetail.getName());
				
				result = accountDetail.getName();
				request.setAttribute("accountDetail", accountDetail);
				
			}else {
				/* 계좌번호가 존재하지 않을때 */
				result = "notAccount";
				return result;
			}
			
		}else {//타 은행으로 이체
			System.out.println("타은행으로 이체");
			otherAccountCheck = clientDao.checkOtherBank(BankAccountNumber); //0이 나오면 계좌가 없는거
			
			if(otherAccountCheck != 0) {
				OtherBankAccountDto otherAccountDetail = clientDao.otherBankAccountDetail(BankAccountNumber);
				
				System.out.println("otherAccountDetail.getName() : "+otherAccountDetail.getName());
				request.setAttribute("accountDetail", otherAccountDetail);
				result = otherAccountDetail.getName();
			
			}else {
				/* 계좌번호가 존재하지 않을때 */
				result = "notAccount";
				return result;
			}
		}
		
		/* 계좌 비밀번호 check */
		
		if(check == -1) {
			result ="checkPwd";
			return result;
		}else if(check == 0){
			result = "notAccount";
			return result;
		}
		
		
		/* 이체금액이 잔액보다 작은지 확인 */
		BankAccountDto accountDetailA =clientDao.accountDetail(account_number);
		System.out.println("accountDetailA.getRemain_money() : "+accountDetailA.getRemain_money());
		
		if(accountDetailA.getRemain_money() < money) {
					result = "checkMoney";
					return result;
		}

		
		System.out.println("return 바로 아래 result : "+result);
		
		
		return result;
	}

	
	@RequestMapping("/deposit")
	public ModelAndView viewBm(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return new ModelAndView("client/deposit");
	}
	
	

}
