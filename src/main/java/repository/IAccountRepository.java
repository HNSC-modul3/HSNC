package repository;


import model.Account;

public interface IAccountRepository {
    Account findByUsername(String username);

    void save(Account newAccount);

    void update(Account currentAccount);
}