package repository;

import model.Product;

import java.util.List;

public interface IBuyerRepositoty {
    List<Product> getAllProducts();

    List<Product> searchProducts(String keyword);
}
