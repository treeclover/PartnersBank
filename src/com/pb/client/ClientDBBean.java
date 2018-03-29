package com.pb.client;

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
	public List<TradeLogDto> tradeLogList(TradeLogDto tradeLogDto) {
		return SqlMapClient.getSession().selectList("Personal.tradeLogList", tradeLogDto);
	}

}
