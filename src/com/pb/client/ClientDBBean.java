package com.pb.client;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.pb.db.SqlMapClient;


@Component("clientDao")
public class ClientDBBean implements ClientDao{
	@Override
	public List<BankAccountDto> accountList(String user_id) {
		return SqlMapClient.getSession().selectList("Personal.accountList",user_id);
	}

	@Override
	public List<TradeLogDto> tradeLogList(HashMap<String, Object> map) {
		if(map.get("inquireContent") == "total" | map.get("inquireContent").equals("total") ) {
			System.out.println("inquireContent : total");
			return SqlMapClient.getSession().selectList("Personal.tradeLogList", map);
		}else if(map.get("inquireContent") == "deposit" | map.get("inquireContent").equals("deposit")) {
			System.out.println("inquireContent : deposit");
			return SqlMapClient.getSession().selectList("Personal.tradeLogListDeposit", map);
		}else {
			System.out.println("inquireContent : withdrawal");
			return SqlMapClient.getSession().selectList("Personal.tradeLogListWithdrawal", map);
		}
		
	}
	
	@Override
	public int check(String account_number,String pwd) {
		int result = 0;
		int count = SqlMapClient.getSession().selectOne("Personal.checkAccount",account_number);
		
		if( count != 0) {
			//계좌가 있다.
			BankAccountDto accountDetail = accountDetail(account_number);
			if(pwd.equals(accountDetail.getPassword())) {
				//패스워드가 맞으면 1을 리턴
				result = 1;
				SqlMapClient.getSession().update("Personal.updateIncorrectCountReset",account_number);
			}else {
				//패스워드가 틀리면 -1을 리턴
				result = -1;
				SqlMapClient.getSession().update("Personal.updateIncorrectCount",account_number);
			}
			
		}else {
			//계좌가 없다.
			result = 0;
		}
		
		return result;
	}

	@Override
	public int checkBank(String account_number) {
		int result = SqlMapClient.getSession().selectOne("Personal.checkBank",account_number);
		
		if( result != 0) {
			//계좌가 있다.
			result = 1;
		}else {
			//계좌가 없다.
			result = 0;
		}
		
		return result;
	}

	@Override
	public int checkOtherBank(String account_number) {
		int result = SqlMapClient.getSession().selectOne("Personal.checkOtherAccount",account_number);
		
		if( result != 0) {
			//계좌가 있다.
			result = 1;
		}else {
			//계좌가 없다.
			result = 0;
		}
		
		return result;
	}

	@Override
	public BankAccountDto accountDetail(String account_number) {
		return SqlMapClient.getSession().selectOne("Personal.accountDetail", account_number);
	}

	@Override
	public OtherBankAccountDto otherBankAccountDetail(String account_number) {
		return SqlMapClient.getSession().selectOne("Personal.otherBankAccountDetail", account_number);
	}


}
