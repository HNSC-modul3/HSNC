package service.impl;

import model.ShoppingCartItem;
import repository.IShoppingCartRepo;
import repository.impl.ShoppingCartRepo;
import service.IShoppingCartService;

import java.util.List;

public class ShoppingCartService implements IShoppingCartService {
    private final IShoppingCartRepo shoppingCartRepo = new ShoppingCartRepo();

    @Override
    public List<ShoppingCartItem> getCartItems() {
        return shoppingCartRepo.getCartItems();
    }

    @Override
    public void addItem(int productId, int quantity) {
        shoppingCartRepo.addItem(productId, quantity);
    }

    @Override
    public void updateItem(int itemId, int quantity) {
        shoppingCartRepo.updateItem(itemId, quantity);
    }

    @Override
    public void removeItem(int itemId) {
        shoppingCartRepo.removeItem(itemId);
    }
}
