package repository;

import model.User;

public interface IUserRepository {
    User findById(int userId);

    int save(User newUser);

    void update(User currentUser);
}