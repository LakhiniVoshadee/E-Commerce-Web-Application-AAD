<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
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

        .order-header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
        }

        .order-table th,
        .order-table td {
            vertical-align: middle;
        }

        .order-table th {
            background-color: #343a40;
            color: #fff;
        }

        .order-table td {
            background-color: #fff;
            color: #343a40;
        }

        .btn-dark {
            border-radius: 5px;
            letter-spacing: 0.5px;
        }

        .form-control {
            border: 1px solid #dee2e6;
        }

        .summary-card {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn-place-order {
            background-color: #343a40;
            color: #fff;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-place-order:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="#">Place Order</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <!-- Cart Summary -->
        <div class="col-md-8">
            <h2 class="mb-4 order-header">Order Summary</h2>
            <div class="table-responsive">
                <table class="table order-table">
                    <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Product 1</td>
                        <td>2</td>
                        <td>$49.99</td>
                        <td>$99.98</td>
                    </tr>
                    <tr>
                        <td>Product 2</td>
                        <td>1</td>
                        <td>$29.99</td>
                        <td>$29.99</td>
                    </tr>
                    <!-- Repeat rows dynamically -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Order Details Form -->
        <div class="col-md-4">
            <h2 class="mb-4 order-header">Order Details</h2>
            <form>
                <div class="mb-3">
                    <label for="orderDate" class="form-label">Order Date</label>
                    <input type="date" class="form-control" id="orderDate" value="2025-01-26">
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select class="form-select" id="status">
                        <option value="Pending" selected>Pending</option>
                        <option value="Processing">Processing</option>
                        <option value="Shipped">Shipped</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="totalAmount" class="form-label">Total Amount</label>
                    <input type="text" class="form-control" id="totalAmount" value="$129.97" readonly>
                </div>
                <button type="button" class="btn btn-place-order w-100">Place Order</button>
            </form>
        </div>
    </div>
</div>

<!-- Summary and Checkout -->
<div class="container mt-4">
    <div class="row">
        <div class="col-md-12 text-end">
            <button class="btn btn-dark px-4">
                <i class="fas fa-arrow-left me-2"></i>Continue Shopping
            </button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelector('.btn-place-order').addEventListener('click', function () {
        alert('Order placed successfully!');
    });
</script>
</body>
</html>
