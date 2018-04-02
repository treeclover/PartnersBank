package com.pb.client;

import java.util.HashMap;
import java.util.List;


public interface ClientDao {
	public List<BankAccountDto> accountList(String user_id);
	public List<TradeLogDto> tradeLogList(HashMap<String, Object> map);
}
