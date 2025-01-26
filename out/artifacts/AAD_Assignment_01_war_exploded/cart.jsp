<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .cart-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
        }

        .cart-table th,
        .cart-table td {
            vertical-align: middle;
        }

        .cart-table th {
            background-color: #343a40;
            color: #fff;
        }

        .cart-table td {
            background-color: #fff;
            color: #343a40;
        }

        .btn-dark {
            border-radius: 5px;
            letter-spacing: 0.5px;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #dee2e6;
            transition: all 0.3s;
        }

        .product-card:hover {
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-add-to-cart {
            background-color: #343a40;
            color: #fff;
            border-radius: 20px;
            transition: background-color 0.2s;
        }

        .btn-add-to-cart:hover {
            background-color: #495057;
        }

        .cart-summary {
            font-weight: bold;
            color: #343a40;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Cart System</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <!-- Product List -->
    <div class="row mb-5">
        <h2 class="mb-4 cart-header">Available Products</h2>
        <div class="col-12 col-md-4">
            <div class="product-card card p-3">
                <img src="https://via.placeholder.com/300" class="card-img-top mb-3" alt="Product Image">
                <h5 class="card-title">Product Name</h5>
                <p class="card-text">$49.99</p>
                <div class="d-flex align-items-center">
                    <input type="number" class="form-control form-control-sm me-2" min="1" value="1" style="width: 70px;">
                    <button class="btn btn-sm btn-add-to-cart">
                        <i class="fas fa-cart-plus me-2"></i>Add to Cart
                    </button>
                </div>
            </div>
        </div>
        <!-- Repeat similar blocks for more products -->
    </div>

    <!-- Cart -->
    <div class="row">
        <h2 class="mb-4 cart-header">Your Cart</h2>
        <div class="table-responsive">
            <table class="table cart-table">
                <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Subtotal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Product 1</td>
                    <td>
                        <input type="number" class="form-control form-control-sm" min="1" value="2" style="width: 80px;">
                    </td>
                    <td>$49.99</td>
                    <td>$99.98</td>
                    <td>
                        <button class="btn btn-sm btn-danger">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </td>
                </tr>
                <!-- Repeat rows for more cart items -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Cart Summary -->
    <div class="row mt-4">
        <div class="col-md-6 offset-md-6">
            <div class="cart-summary card p-3">
                <h4>Total: $199.96</h4>
                <button class="btn btn-dark w-100 mt-3"><a href="order.jsp">Proceed to Checkout</a></button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add-to-cart logic (dummy example)
    document.querySelectorAll('.btn-add-to-cart').forEach(button => {
        button.addEventListener('click', function () {
            alert('Product added to cart!');
        });
    });
</script>
</body>
</html>
