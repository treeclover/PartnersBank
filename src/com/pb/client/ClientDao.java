package com.pb.client;

import java.util.List;


public interface ClientDao {
	public List<BankAccountDto> accountList(BankAccountDto bankaccountDto);
}
