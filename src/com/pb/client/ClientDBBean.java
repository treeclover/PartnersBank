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

}
