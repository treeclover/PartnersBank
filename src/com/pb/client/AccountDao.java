package com.pb.client;

public interface AccountDao {
	public int addAccount(ClientDto client);

	public int checkByIdAndPw(ClientDto client);

	public ClientDto findById(ClientDto client);
}
