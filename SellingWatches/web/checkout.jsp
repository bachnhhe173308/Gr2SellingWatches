<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                background-color: #f2f2f2;
                padding: 20px;
                border-radius: 5px;
            }

            .icon-container {
                margin-bottom: 20px;
                font-size: 24px;
            }

            .btn {
                background-color: #101010;
                color: white;
                font-size: 17px;
            }

            .btn:hover {
                background-color: #000;
            }

            a {
                color: #2196F3;
            }

            /* Responsive layout */
            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>

        <a href="home" class="btn btn-primary">Home</a>
        <button onclick="goBack()" class="btn btn-secondary">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-8">
                    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th>ProductID</th>
                                <th>ProductName</th>
                                <th>img</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${cart.items}">
                                <tr>
                                    <td>${item.product.getProductID()}</td>
                                    <td>${item.product.getProductName()}</td>
                                    <td><img src="${item.product.image}" width="50" class="img-fluid"></td>
                                    <td>${item.quantity}</td>
                                    <td>${item.price}</td>
                                    <td>${item.quantity * item.price}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <p><b>Total Cart Value: </b>${cart.totalMoney}</p>
                </div>
                <div class="col-md-4">
                    <h3>Billing Address</h3>
                    <form action="checkout" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="UserID" value="${user.getUserID()}"/>
                        <div class="form-group">
                            <label for="fname">Full Name</label>
                            <input type="text" class="form-control" name="fullName" value="${user.getFullname()}"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" name="email" value="${user.getMail()}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="adr">Address</label>
                            <input type="text" class="form-control" name="address" value="${user.getAddress()}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.getPhone()}">
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var phone = document.getElementById("phone").value;

                // Validation for phone number
                if (!validatePhoneNumber(phone)) {
                    alert("Invalid Phone Number !");
                    return false;
                }

                return true; // Form is valid
            }

            function validatePhoneNumber(phone) {
                // Pattern for validating phone number (Vietnamese phone numbers only)
                var phonePattern = /^0\d{9}$/;

                return phonePattern.test(phone);
            }
        </script>

    </body>
</html>