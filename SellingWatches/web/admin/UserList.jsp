<%@page import="java.util.List"%>
<%@page import="Model.User"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Responsive Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding-top: 56px;
            }
            .table th {
                background-color: #343a40; /* Màu nền cho header bảng */
                color: #ffffff;
            }
            #sidebar {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                width: 250px;
                overflow-y: auto;
                background-color: #343a40;
                padding-top: 20px;
                transition: all 0.3s;
                z-index: 999; /* High z-index to be on top of other content */
            }
            #sidebar.collapsed {
                margin-left: -250px;
            }
            #content {
                transition: margin-left 0.3s;
                padding: 20px;
            }

            .navbar .sidebar-toggle {
                margin-right: 10px;
                cursor: pointer;
            }
            .footer {
                position: fixed;
                bottom: 0;
                width: 100%;
                text-align: center;
                padding: 10px 0;
                background-color: #f8f9fa;
                .container {
                    max-width: 1200px;
                }
                header {
                    background-color: #007bff; /* Màu nền cho header */
                    padding: 10px 0;
                    color: #ffffff;
                    margin-bottom: 20px;
                }
                header h1 {
                    text-align: center;
                }
                nav a {
                    color: #ffffff;
                    margin: 0 15px;
                    font-weight: bold;
                    text-decoration: none;
                }

            }
        </style>
    </head>
    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">
            <span class="navbar-brand sidebar-toggle" id="sidebarToggle">&#9776;</span>
            <span class="navbar-text ml-auto">
                ${session.user.fullname}
            </span>
        </nav>

        <!-- Sidebar -->

        <div id="sidebar" class="sidebar">

            <nav class="nav flex-column">

                <a class="nav-item nav-link active" href="#">Home</a>
                <a class="nav-item nav-link" href="admin">Dashboard</a>
                <a class="nav-item nav-link" href="home">Home</a>
                <a class="nav-item nav-link" href="userlist">User List</a>
                <a class="nav-item nav-link" href="#">Settings</a>
            </nav>
        </div>

        <!-- Page Content -->
        <div id="content">
            <div class="container">
                <h2 class="mb-4">User List</h2>
                <div class="row mb-3">
                    <div class="col">
                        <form action="SearchByRole" method="get" class="form-inline">    
                            <label class="my-1 mr-2" for="roleSelect">Role:</label>
                            <select name="role" class="custom-select my-1 mr-sm-2" id="roleSelect" onchange="this.form.submit();">
                                <option value="5">Search by Role</option>
                                <option value="0">All Role</option>
                                <option value="1">Customer</option>
                                <option value="2">Admin</option>
                                <option value="3">Marketing</option>
                                <option value="4">Sale</option>
                            </select>
                        </form>
                    </div>
                    <div class="col">
                        <form action="SearchByGender" method="get" class="form-inline">
                            <label class="my-1 mr-2" for="genderSelect">Gender:</label>
                            <select name="gender" class="custom-select my-1 mr-sm-2" id="genderSelect" onchange="this.form.submit();">
                                <option value="">Search by Gender</option>
                                <option value="2">All Gender</option>
                                <option value="1">Male</option>
                                <option value="0">Female</option>
                            </select>
                        </form>
                    </div>
                    <div class="col">
                        <form action="SearchByStatus" method="get" class="form-inline">
                            <label class="my-1 mr-2" for="statusSelect">Status:</label>
                            <select name="status" class="custom-select my-1 mr-sm-2" id="statusSelect" onchange="this.form.submit();">
                                <option value="">Search by Status</option>
                                <option value="2">All Status</option>
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </form>
                    </div>
                </div>

                <table class="table table-striped table-bordered" id="userTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Avatar</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Role</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td><a href="UserDetail?userID=${user.userID}">${user.userID}</a></td>
                                <td>${user.fullname}</td>
                                <td>
                                    <!-- Sửa đoạn này -->
                                    <img src="uploads/${user.avatar}" alt="User Avatar" class="img-fluid img-thumbnail" style="max-width: 80px; height: auto;">
                                </td>         
                                <td>${user.gender ? 'Male' : 'Female'}</td>
                                <td>${user.mail}</td>
                                <td>${user.phone}</td>
                                <td>
                                    <select onchange="location.href = 'ChangeRole?userID=${user.userID}&role=' + this.value;">
                                        <option value="1" ${user.roleID == 1 ? 'selected' : ''}>Customer</option>
                                        <option value="2" ${user.roleID == 2 ? 'selected' : ''}>Admin</option>
                                        <option value="3" ${user.roleID == 3 ? 'selected' : ''}>Marketing</option>
                                        <option value="4" ${user.roleID == 4 ? 'selected' : ''}>Sale</option>
                                    </select>
                                </td>
                                <td>
                                    <select onchange="location.href = 'ChangeStatus?userID=${user.userID}&status=' + this.value;">
                                        <option value="1" ${user.userStatus ? 'selected' : ''}>Active</option>
                                        <option value="0" ${!user.userStatus ? 'selected' : ''}>Inactive</option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <span class="text-muted">&copy; 2024 My App. All rights reserved.</span>
            </div>
        </footer>

        <!-- Bootstrap and necessary plugins JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $('#userTable').DataTable();
                                                    });
                                                    // Toggle the side navigation
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        var sidebarToggle = document.getElementById('sidebarToggle');
                                                        sidebarToggle.addEventListener('click', function () {
                                                            var sidebar = document.getElementById('sidebar');
                                                            sidebar.classList.toggle('collapsed');
                                                            var content = document.getElementById('content');
                                                            content.style.marginLeft = sidebar.classList.contains('collapsed') ? '0' : '250px';
                                                        });
                                                    });
        </script>
    </body>
</html>