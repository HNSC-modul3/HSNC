package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private  IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAllProducts() {
        return productRepository.findAllProducts();
    }

    @Override
    public void saveProduct(Product product) {
        productRepository.saveProduct(product);
    }

    @Override
    public void deleteProduct(int product_id) {
        productRepository.deleteProduct(product_id);
    }

    @Override
    public void updateProduct(Product product) {
        productRepository.updateProduct(product);
    }

    @Override
    public Product getById(int product_id) {
        return productRepository.getById(product_id);
    }

    @Override
    public List<Product> searchProducts(String name) {
        return productRepository.searchProducts(name);
    }


}
