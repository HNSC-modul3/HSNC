package service.impl;

import model.Product;
import repository.IBuyerRepositoty;
import repository.impl.BuyerRepository;
import service.IBuyerService;

import java.util.List;

public class BuyerService implements IBuyerService {
    private IBuyerRepositoty buyerRepositoty=new BuyerRepository();
    @Override
    public List<Product> getAllProducts() {
        return buyerRepositoty.getAllProducts();
    }

    @Override
    public List<Product> searchProducts(String keyword) {
        return buyerRepositoty.searchProducts(keyword);
    }
}
