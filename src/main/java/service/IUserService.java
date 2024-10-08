package service;

import model.User;

public interface IUserService {
    User getUserById(int userId);

    User getUserByEmail(String email);

    int addUser(User newUser);

    void updateUser(User currentUser);
}
