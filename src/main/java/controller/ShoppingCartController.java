package controller;

import model.ShoppingCart;
import model.ShoppingCartItem;
import service.IShoppingCartService;
import service.impl.ShoppingCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShoppingCartController", urlPatterns = "/cart")
public class ShoppingCartController extends HttpServlet {
    private final IShoppingCartService shoppingCartService = new ShoppingCartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "view":
                viewCart(request, response);
                break;
            case "remove":
                removeItem(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/cart?action=view");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "add":
                addItem(request, response);
                break;
            case "update":
                updateCart(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/cart?action=view");
                break;
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ShoppingCartItem> items = shoppingCartService.getCartItems();
        request.setAttribute("cartItems", items);
        request.getRequestDispatcher("/gio-hang/cart.jsp").forward(request, response);
    }

    private void addItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        shoppingCartService.addItem(productId, quantity);
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] quantities = request.getParameterValues("quantity");
        String[] itemIds = request.getParameterValues("item_id");

        for (int i = 0; i < itemIds.length; i++) {
            int itemId = Integer.parseInt(itemIds[i]);
            int quantity = Integer.parseInt(quantities[i]);
            shoppingCartService.updateItem(itemId, quantity);
        }
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }

    private void removeItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int itemId = Integer.parseInt(request.getParameter("item_id"));
        shoppingCartService.removeItem(itemId);
        response.sendRedirect(request.getContextPath() + "/cart?action=view");
    }
}
