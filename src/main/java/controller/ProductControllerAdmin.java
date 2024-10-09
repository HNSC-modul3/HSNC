package controller;


import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "productControllerAdmin", value = "/fruit-admin")
public class ProductControllerAdmin extends HttpServlet {
    private static final String ACTION_CREATE = "create";
    private static final String ACTION_EDIT = "edit";
    private static final String ACTION_DELETE = "delete";
    private static final String ACTION_SEARCH = "search";
    private final IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            List<Product> products;
            if (ACTION_CREATE.equals(action)) {
                request.getRequestDispatcher("/giao-dien/create/them-san-pham.jsp").forward(request, response);
            } else if (ACTION_EDIT.equals(action)) {
                int editId = Integer.parseInt(request.getParameter("id"));
                Product product = productService.getById(editId);
                request.setAttribute("products", product);
                request.getRequestDispatcher("/giao-dien/create/sua-san-pham.jsp").forward(request, response);
            } else if (ACTION_DELETE.equals(action)) {
                int deleteId = Integer.parseInt(request.getParameter("id"));
                productService.deleteProduct(deleteId);
                response.sendRedirect(request.getContextPath() + "/Admin");
            } else if (ACTION_SEARCH.equals(action)) {
                String searchKeyword = request.getParameter("keyword");
                products = productService.searchProducts(searchKeyword);
                request.setAttribute("products", products);
                request.getRequestDispatcher("/giao-dien/create/hien-thi-admin.jsp").forward(request, response);
            } else {
                products = productService.findAllProducts();
                request.setAttribute("products", products);
                request.getRequestDispatcher("/giao-dien/create/hien-thi-admin.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi.");
            request.getRequestDispatcher("giao-dien/create/canh-bao-loi.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) action = "";
        try {
            if (ACTION_CREATE.equals(action)) {
                String name = request.getParameter("product_name");
                String description = request.getParameter("product_description");
                int price = Integer.parseInt(request.getParameter("product_price"));
                String image = request.getParameter("product_image");
                int categoryId = Integer.parseInt(request.getParameter("category_id"));
                Product newProduct = new Product(0, name, price, description, image, categoryId);
                productService.saveProduct(newProduct);
                response.sendRedirect(request.getContextPath() + "/Admin");
            } else if (ACTION_EDIT.equals(action)) {
                int id = Integer.parseInt(request.getParameter("product_id"));
                String updatedName = request.getParameter("name");
                String updatedDescription = request.getParameter("description");
                int updatedPrice = Integer.parseInt(request.getParameter("price"));
                String updatedImage = request.getParameter("image");
                int updatedCategoryId = Integer.parseInt(request.getParameter("category_id"));
                Product updatedProduct = new Product(id, updatedName, updatedPrice, updatedDescription, updatedImage, updatedCategoryId);
                productService.updateProduct(updatedProduct);
                response.sendRedirect(request.getContextPath() + "/Admin");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Hành động không hợp lệ");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID sản phẩm không hợp lệ");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi.");
            request.getRequestDispatcher("giao-dien/create/canh-bao-loi.jsp").forward(request, response);
        }
    }
}











