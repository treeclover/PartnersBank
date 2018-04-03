package com.pb.client;

import java.util.HashMap;
import java.util.List;


public interface ClientDao {
	public List<BankAccountDto> accountList(String user_id);
	public List<TradeLogDto> tradeLogList(HashMap<String, Object> map);
	public int check(String account_number,String pwd) ;
	public BankAccountDto accountDetail(String account_number);
	public int checkOtherBank(String account_number);
	public OtherBankAccountDto otherBankAccountDetail(String account_number);
}
