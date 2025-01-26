<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Fashion Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }
        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 30px;
            font-weight: 700;
            color: #000;
        }
        .section-content {
            text-align: center;
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 40px;
        }
        .card {
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card img {
            height: 250px;
            object-fit: cover;
        }
        .btn-dark-custom {
            background-color: #000;
            color: white;
            border: none;
            transition: all 0.3s ease;
        }
        .btn-dark-custom:hover {
            background-color: #333;
            transform: translateY(-5px);
        }
        .team-member img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 3px solid #000;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <h1 class="section-title">About Fashion Store</h1>
    <p class="section-content">
        Welcome to our Fashion Store! We offer the latest in fashion trends, curated with care and style.
    </p>

    <!-- Image Cards -->
    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="card h-100">
                <img src="https://plus.unsplash.com/premium_photo-1724220738789-0aa02a6c9680?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="card-img-top" alt="Fashion Collection">
                <div class="card-body">
                    <h5 class="card-title">Trendy Collections</h5>
                    <p class="card-text">Discover the latest trends in fashion and shop collections that suit every style.</p>
                    <a href="#" class="btn btn-dark-custom">Explore Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100">
                <img src="https://as1.ftcdn.net/v2/jpg/06/15/38/32/1000_F_615383289_yLOyZWe8Gq4OUaLu7qKYOcihMIZgvqfO.jpg" class="card-img-top" alt="Sustainable Fashion">
                <div class="card-body">
                    <h5 class="card-title">Makeup Collections</h5>
                    <p class="card-text">We offer eco-friendly and sustainable fashion choices that look great and make a positive impact.</p>
                    <a href="#" class="btn btn-dark-custom">Explore Now</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100">
                <img src="https://as2.ftcdn.net/v2/jpg/02/71/39/77/1000_F_271397775_nBqmHvUZ3HJY7wwrO5WxFFVCwOv86MTj.jpg" class="card-img-top" alt="Customer Support">
                <div class="card-body">
                    <h5 class="card-title">Perfume Collection</h5>
                    <p class="card-text">Our customer service team is here to help you every step of the way, ensuring a seamless shopping experience.</p>
                    <a href="#" class="btn btn-dark-custom">Explore Now</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Team Section -->
    <div class="text-center mt-5">
        <h2 class="section-title">Meet Our Team</h2>
        <div class="row justify-content-center">
            <div class="col-md-4 team-member">
                <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80" alt="Team Member 1" class="rounded-circle mb-3">
                <h4>Jane Doe</h4>
                <p>Creative Director</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80" alt="Team Member 2" class="rounded-circle mb-3">
                <h4>John Smith</h4>
                <p>CEO & Founder</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="https://images.unsplash.com/photo-1534751516642-a1af1ef26a56?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1889&q=80" alt="Team Member 3" class="rounded-circle mb-3">
                <h4>Emily Davis</h4>
                <p>Head of Marketing</p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>