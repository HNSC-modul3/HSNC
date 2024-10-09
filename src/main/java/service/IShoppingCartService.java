package service;

import model.ShoppingCartItem;

import java.util.List;

public interface IShoppingCartService {
    List<ShoppingCartItem> getCartItems();

    void addItem(int productId, int quantity);

    void updateItem(int itemId, int quantity);

    void removeItem(int itemId);
}
