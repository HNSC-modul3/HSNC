package repository.impl;

import model.Product;
import database.BaseRepository;
import repository.IBuyerRepositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BuyerRepository implements IBuyerRepositoty {

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Product product = mapRowToProduct(resultSet);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE name LIKE ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = mapRowToProduct(resultSet);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private Product mapRowToProduct(ResultSet resultSet) throws SQLException {
        return new Product(
                resultSet.getInt("product_id"),
                resultSet.getString("name"),
                resultSet.getInt("price"),
                resultSet.getString("description"),
               resultSet.getString("image"),
                resultSet.getInt("category_id")
        );
    }
}
