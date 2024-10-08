package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    Product getById(int productId);

    List<Product> findAllProducts();

    void saveProduct(Product product);

    void deleteProduct(int productId);

    void updateProduct(Product product);

    List<Product> searchProducts(String name);
}
