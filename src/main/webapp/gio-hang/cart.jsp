<%--
  Created by IntelliJ IDEA.
  User: hieu
  Date: 10/8/2024
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Giỏ Hàng</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .button {
            padding: 8px 12px;
            color: white;
            background-color: #007bff;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Giỏ Hàng của Bạn</h1>

<c:if test="${not empty cartItems}">
    <form action="cart" method="post">
        <table>
            <tr>
                <th>ID</th>
                <th>Tên Sản Phẩm</th>
                <th>Số Lượng</th>
                <th>Hành Động</th>
            </tr>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.productId}</td>
                    <td>
                        <input type="hidden" name="item_id" value="${item.id}" />
                        <input type="number" name="quantity" value="${item.quantity}" min="1" />
                    </td>
                    <td>
                        <button type="submit" class="button" name="action" value="update">Cập Nhật</button>
                        <a href="cart?action=remove&item_id=${item.id}" class="button" style="background-color: #dc3545;">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit" class="button" name="action" value="update">Cập Nhật Tất Cả</button>
    </form>
</c:if>

<c:if test="${empty cartItems}">
    <p>Giỏ hàng của bạn hiện tại rỗng.</p>
</c:if>

<a href="/home" class="button">Tiếp Tục Mua Sắm</a>
</body>
</html>
