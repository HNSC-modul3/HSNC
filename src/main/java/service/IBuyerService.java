package service;

import model.Product;

import java.util.List;

public interface IBuyerService {
    List<Product> getAllProducts();

    List<Product> searchProducts(String keyword);
}
