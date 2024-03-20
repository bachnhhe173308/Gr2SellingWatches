<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Detail</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa; /* Màu n?n nh? nhàng */
            }
            .container {
                background-color: #ffffff; /* Màu n?n cho container */
                border-radius: 8px; /* Bo tròn góc */
                box-shadow: 0 2px 4px rgba(0,0,0,.1); /* Thêm bóng ?? nh? */
                margin-top: 20px;
                padding: 20px;
            }
            h2 {
                color: #333; /* Màu ?en nh?t cho tiêu ?? */
            }
            .form-group label {
                color: #555; /* Màu t?i h?n cho nhãn */
            }
            .btn-primary {
                background-color: #000; /* Màu n?n ?en cho nút */
                border-color: #000; /* Màu vi?n */
            }
            .btn-success {
                background-color: #444; /* Màu n?n ??m h?n cho nút c?p nh?t */
                border-color: #444;
            }
            .btn-primary:hover, .btn-success:hover {
                background-color: #333; /* Màu khi hover */
                border-color: #333;
            }
            .form-control, .form-control-plaintext {
                color: #000; /* Màu ch? */
            }
            .img-thumbnail {
                border: 2px solid #ddd; /* Vi?n cho ?nh */
                border-radius: 8px; /* Bo tròn góc */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>User Details</h2>
            <div class="row">
                <div class="col-md-4">
                    <img src="uploads/${user.avatar}?timestamp=${System.currentTimeMillis()}" alt="User Avatar" class="img-thumbnail">
                </div>

                <div class="col-md-8">
                    <form action="UploadAvatarServlet" method="post" enctype="multipart/form-data" class="mb-3">
                        <input type="hidden" name="userID" value="${user.userID}">
                        <div class="form-group">
                            <label for="avatar">Select image to upload:</label>
                            <input type="file" name="img" id="avatar" class="form-control-file">
                        </div>
                        <input type="submit" value="Upload Image" name="submit" class="btn btn-primary">
                    </form>
                    <form action="UpdateUser" method="post" id="updateUserForm">
                        <input type="hidden" name="userID" value="${user.userID}">
                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" name="fullname" value="${user.fullname}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email:</label>
                            <p class="form-control-plaintext">${user.mail}</p>
                        </div>
                        <div class="form-group">
                            <label>Phone:</label>
                            <input type="text" name="phone" id="phone" value="${user.phone}" class="form-control">
                            <small id="phoneError" class="text-danger"></small> <!-- Error message placeholder -->
                        </div>
                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" name="address" value="${user.address}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Gender:</label>
                            <div>
                                <input type="radio" name="gender" value="1" ${user.gender ? 'checked' : ''}> Male
                                <input type="radio" name="gender" value="0" ${!user.gender ? 'checked' : ''}> Female
                            </div>
                        </div>
                        <input type="submit" value="Update User" class="btn btn-success">
                    </form>
                </div>
            </div>
        </div>
        <!-- Include Bootstrap JS and its dependencies -->
        <script>
            // Function to validate phone number
            function validatePhone() {
                // Get the phone number input element
                var phoneInput = document.getElementById('phone');
                // Get the phone number value
                var phone = phoneInput.value.trim();
                // Pattern for validating phone number (Vietnamese phone numbers only)
                var phonePattern = /^0\d{9}$/;
                // Check if the phone number matches the pattern
                if (!phonePattern.test(phone)) {
                    // If the phone number is not valid, show an error message
                    document.getElementById('phoneError').innerText = 'Please enter a valid Vietnamese phone number starting with 0 and containing 10 digits.';
                    // Clear the phone number input field
                    phoneInput.value = '';
                    // Return false to prevent form submission
                    return false;
                }
                // If the phone number is valid, clear the error message
                document.getElementById('phoneError').innerText = '';
                // Return true to allow form submission
                return true;
            }

            // Add event listener to the form to validate phone number before submission
            document.getElementById('updateUserForm').addEventListener('submit', function (event) {
                // Validate phone number
                if (!validatePhone()) {
                    // If phone number is not valid, prevent form submission
                    event.preventDefault();
                }
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>