<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cửa Hàng Hoa Quả</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<header style="background-color: #ffd2ab;">
    <div class="container d-flex align-items-center justify-content-between fixed-top" style="top: 0;">
        <a href="/Fruitshop?action=home">
            <img src="https://free.vector6.com/wp-content/uploads/2020/07/KhoThietKe-0000000184.jpg" alt="Logo" class="logo" style="height: 80px;">
        </a>
        <form class="d-flex ms-3" method="get" action="/gio-hang/productList.jsp">
            <input class="form-control me-2" type="search" name="keyword" placeholder="Tìm sản phẩm" aria-label="Search">
            <button class="btn btn-outline-light" style="color: lavenderblush; background: #ff7c2a;" type="submit">Tìm</button>
        </form>

        <div class="user-cart ms-3">
            <a href="/cart?action=view" class="btn btn-warning position-relative">
                <i class="fas fa-shopping-cart"></i> Giỏ Hàng
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    <c:out value="${sessionScope.cartSize != null ? sessionScope.cartSize : 0}"/>
                </span>
            </a>
        </div>

        <div class="user-options ms-3">
            <c:if test="${not empty sessionScope.currentUser}">
                <span>Xin chào, ${sessionScope.currentUser.name}!</span>
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" id="settingsDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Cài đặt
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="settingsDropdown">
                        <li><a class="dropdown-item" href="/Fruitshop?action=edit">Sửa thông tin</a></li>
                        <c:if test="${sessionScope.currentUser.role_id == 2}">
                            <li><a class="dropdown-item" href="/giao-dien/create/hien-thi-admin.jsp">Sửa danh sách</a></li>
                        </c:if>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/Fruitshop?action=logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${empty sessionScope.currentUser}">
                <button class="btn btn-primary" onclick="window.location.href='/Fruitshop?action=login'">Đăng nhập</button>
            </c:if>
        </div>

    </div>
</header>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top: 100px;">
    <div class="container-fluid justify-content-center">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Sản Phẩm</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Trái Cây</a></li>
                        <li><a class="dropdown-item" href="#">Giỏ Trái Cây</a></li>
                        <li><a class="dropdown-item" href="#">Hoa Quả Nhập Khẩu</a></li>
                        <li><a class="dropdown-item" href="#">Hoa Quả Sấy</a></li>
                        <li><a class="dropdown-item" href="#">Hoa Quả Tươi</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Giới Thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Tin Tức</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="banner text-center text-white py-5">
    <div class="container">
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="2000">
                    <img src="https://tfruit.com.vn/wp-content/uploads/2023/04/Voucher-50k.jpg" class="d-block w-100" alt="Voucher 50k">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="https://tfruit.com.vn/wp-content/uploads/2020/11/GV2-1.jpg" class="d-block w-100" alt="Hình ảnh sản phẩm 2">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="https://www.thietkewebchuanseo.com/images/bai-viet-quang-cao-ban-trai-cay-4942.jpg" class="d-block w-100" alt="Hình ảnh sản phẩm 3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>

<section class="py-5">
    <div class="container">
        <h3 class="text-center mb-5">Sản Phẩm Nổi Bật</h3>
        <div class="row">
            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product1.imageUrl ? product1.imageUrl : 'https://cdn.benhvienthucuc.vn/wp-content/uploads/2017/09/trai-cay-khong-nen-an-khi-bi-dau-da-day-600x400.jpg'}" class="card-img-top" alt="${product1.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product1.name} cacms</h5>
                        <p class="card-text text-danger">${product1.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product1.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product2.imageUrl ? product2.imageUrl : 'https://cdn.baodongthap.vn/database/image/2019/03/29/oi.png'}" class="card-img-top" alt="${product2.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product2.name}</h5>
                        <p class="card-text text-danger">${product2.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product2.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product3.imageUrl ? product3.imageUrl : 'https://suckhoedoisong.qltns.mediacdn.vn/2015/1-7-loai-hoa-qua-phai-an-ca-vo-moi-tot-cho-suc-khoe-hinh-3-1433562293350.jpg'}" class="card-img-top" alt="${product3.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product3.name}</h5>
                        <p class="card-text text-danger">${product3.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product3.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product4.imageUrl ? product4.imageUrl : 'https://anphar.vn/vnt_upload/news/05_2016/1464230746_trai_cay_nen_an_buoi_toi_3_1.jpg'}" class="card-img-top" alt="${product4.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product4.name}</h5>
                        <p class="card-text text-danger">${product4.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product4.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product5.imageUrl ? product5.imageUrl : 'https://media.tuyenquangtv.vn/public/file/fb9e3a036ab59c2c016ac3618a0d3aec/old_image/uploaded/130/2016/12/9/243_cac-loai-trai-cay-nen-va-khong-nen-an-vao-mua-dong-khong-an-qua-nay-mua-dong-4-1481173701-width500height375.jpg'}" class="card-img-top" alt="${product5.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product5.name}</h5>
                        <p class="card-text text-danger">${product5.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product5.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product6.imageUrl ? product6.imageUrl : 'https://suckhoedoisong.qltns.mediacdn.vn/2014/camngon-17a8d.jpg'}" class="card-img-top" alt="${product6.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product6.name}</h5>
                        <p class="card-text text-danger">${product6.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product6.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product7.imageUrl ? product7.imageUrl : 'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/8/15/942274/Nhung-Loai-Trai-Cay-.jpeg'}" class="card-img-top" alt="${product7.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product7.name}</h5>
                        <p class="card-text text-danger">${product7.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product7.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-6 mb-4">
                <div class="card shadow-sm">
                    <img src="${not empty product8.imageUrl ? product8.imageUrl : 'https://e7.pngegg.com/pngimages/894/727/png-clipart-of-peach-peach-trio-food-fruits.png'}" class="card-img-top" alt="${product8.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product8.name}</h5>
                        <p class="card-text text-danger">${product8.price} VND</p>
                        <a href="/Fruitshop?action=addToCart&productId=${product8.id}" class="btn btn-success">
                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="text-center text-white" style="background-color: #ff7c2a;">
    <div class="container p-4">
        <h5>Liên Hệ Chúng Tôi</h5>
        <p>Email: contact@fruitshop.com</p>
        <p>Điện thoại: 0123 456 789</p>
        <p>Địa chỉ: 123 Đường Hoa Quả, TP. HCM</p>
    </div>
    <div class="contact-links">
        <a href="mailto:contact@fruitshop.com" class="contact-item">
            <i class="fas fa-envelope"></i>
        </a>
        <a href="tel:0123456789" class="contact-item">
            <i class="fas fa-phone"></i>
        </a>
        <a href="https://www.facebook.com/messages/e2ee/t/7946518635382626?locale=vi_VN" class="contact-item">
            <i class="fab fa-facebook"></i>
        </a>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
