package controller;

import model.Product;
import service.IBuyerService;
import service.impl.BuyerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = "/user")
public class BuyerController extends HttpServlet {
    private final IBuyerService buyerService = new BuyerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "viewProducts":
                viewProducts(request, response);
                break;
            case "search":
                searchProducts(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/user?action=viewProducts");
                break;
        }
    }

    private void viewProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = buyerService.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/gio-hang/productList.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<Product> products = buyerService.searchProducts(keyword);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/gio-hang/productList.jsp").forward(request, response);
    }
}
