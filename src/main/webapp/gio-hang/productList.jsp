<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #343a40;
            margin-bottom: 30px;
            text-align: center;
        }

        .input-group {
            max-width: 600px;
            margin: 20px auto;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        .img-thumbnail {
            border: 1px solid #dee2e6;
            border-radius: .25rem;
        }

        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #218838;
        }

        @media (max-width: 576px) {
            .input-group {
                flex-direction: column;
            }
            .input-group input {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
<h1>Product List</h1>

<div class="input-group">
    <form action="${pageContext.request.contextPath}/user?action=search" method="get">
        <input type="text" name="keyword" placeholder="Search products..."
               required value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
        <button type="submit">Search</button>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>Product ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Image</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Product product : products) {
    %>
    <tr>
        <td><%= product.getProduct_id() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getDescription() %></td>
        <td><%= product.getPrice() %></td>
        <td><img src="<%= product.getImage() %>" alt="<%= product.getName() %>" width="100" class="img-thumbnail"></td>
        <td>
            <form action="${pageContext.request.contextPath}/cart?action=add" method="post">
                <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                <input type="number" name="quantity" value="1" min="1">
                <button type="submit" class="btn">Add to Cart</button>
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6">No products found.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
