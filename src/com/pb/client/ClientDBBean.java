package com.pb.client;

import java.util.List;

import org.springframework.stereotype.Component;

import com.pb.db.SqlMapClient;

@Component("PclientDao")
public class ClientDBBean implements ClientDao{
	@Override
	public List<BankAccountDto> accountList(BankAccountDto bankaccountDto) {
		return SqlMapClient.getSession().selectList("Personal.accountList", bankaccountDto);
	}

}
