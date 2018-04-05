package com.pb.client;

import org.springframework.stereotype.Component;

import com.pb.db.SqlMapClient;

@Component("accountDao")
public class AccountDBBean implements AccountDao {

	@Override
	public int addAccount(ClientDto client) {
		return SqlMapClient.getSession().insert("Account.insertAccount", client);
	}

	@Override
	public int checkByIdAndPw(ClientDto client) {
		int result = 0;
		ClientDto temp = SqlMapClient.getSession().selectOne("Account.selectById", client);
		if(temp == null) {
			result = 0;
		} else if(client.getPw().equals(temp.getPw())) {
			result = 1;
		} else {
			result = -1;
		}
		
		return result;
	}

	@Override
	public ClientDto findById(ClientDto client) {
		return SqlMapClient.getSession().selectOne("Account.selectById", client);
	}

}
