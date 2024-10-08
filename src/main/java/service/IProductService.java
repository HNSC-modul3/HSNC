package service;

import model.Product;

import java.util.List;

public interface IProductService {
    Product getById(int id);

    void deleteProduct(int deleteId);

    List<Product> searchProducts(String searchKeyword);

    List<Product> findAllProducts();

    void saveProduct(Product newProduct);

    void updateProduct(Product updatedProduct);
}
