package repository.impl;

import database.BaseRepository;
import model.ShoppingCartItem;
import repository.IShoppingCartRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCartRepo implements IShoppingCartRepo {
    private List<ShoppingCartItem> cartItems = new ArrayList<>();

    @Override
    public List<ShoppingCartItem> getCartItems() {
        List<ShoppingCartItem> items = new ArrayList<>();
        String sql = "SELECT * FROM shopping_cart_items";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                ShoppingCartItem item = new ShoppingCartItem(
                        resultSet.getInt("id"),
                        resultSet.getInt("shopping_cart_id"),
                        resultSet.getInt("product_id"),
                        resultSet.getInt("quantity")
                );
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    @Override
    public void addItem(int productId, int quantity) {
        String sql = "INSERT INTO shopping_cart_items (product_id, quantity) VALUES (?, ?)";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, productId);
            statement.setInt(2, quantity);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateItem(int itemId, int quantity) {
        String sql = "UPDATE shopping_cart_items SET quantity = ? WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, quantity);
            statement.setInt(2, itemId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeItem(int itemId) {
        String sql = "DELETE FROM shopping_cart_items WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, itemId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
