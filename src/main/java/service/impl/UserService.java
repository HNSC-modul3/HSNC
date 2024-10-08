package service.impl;


import model.User;

import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

public class UserService implements IUserService {
    private IUserRepository userRepository;

    public UserService() {
        this.userRepository = new UserRepository();
    }

    @Override
    public User getUserById(int userId) {
        return userRepository.findById(userId);
    }

    @Override
    public int addUser(User newUser) {
        return userRepository.save(newUser);
    }

    @Override
    public void updateUser(User currentUser) {
        userRepository.update(currentUser);
    }

    @Override
    public User getUserByEmail(String email) {
        return null;
    }
}