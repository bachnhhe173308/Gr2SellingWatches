<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="Model.User"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Responsive Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawCharts);

            function drawCharts() {
                // Data for User Status Pie Chart
                var statusData = google.visualization.arrayToDataTable([
                    ['Status', 'Count'],
                    ['Active', <%=request.getAttribute("activeCount") %>],
                    ['Inactive', <%=request.getAttribute("inactiveCount") %>]
                ]);

                var statusOptions = {
                    title: 'User Status Distribution',
                    is3D: true
                };

                var statusChart = new google.visualization.PieChart(document.getElementById('statusPieChart'));
                statusChart.draw(statusData, statusOptions);

                // Data for User Role Pie Chart, corrected approach
                var roleData = google.visualization.arrayToDataTable([
                    ['Role', 'Count'],
            <% Map<Integer, Integer> roleCounts = (Map<Integer, Integer>) request.getAttribute("roleCounts");
                // Assuming role ID mappings are 1=Customer, 2=Admin, 3=Sale, 4=MKT
                String[] roleNames = {"Customer", "Admin", "Sale", "MKT"};
                for (int i = 0; i < roleNames.length; i++) {
                    Integer count = roleCounts.getOrDefault(i + 1, 0);
            %>
                    ['<%= roleNames[i] %>', <%= count %>],
            <% } %>
                ]);

                var roleOptions = {
                    title: 'User Role Distribution',
                    pieHole: 0.4
                };

                var roleChart = new google.visualization.PieChart(document.getElementById('rolePieChart'));
                roleChart.draw(roleData, roleOptions);
            }
        </script>
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
            <span class="navbar-brand sidebar-toggle" id="sidebarToggle">&#9776; </span>
            <span class="navbar-text ml-auto">

            </span>
        </nav>

        <!-- Sidebar -->

        <div id="sidebar" class="sidebar">

            <nav class="nav flex-column">

                <a class="nav-item nav-link active" href="#">Home</a>
                <a class="nav-item nav-link" href="UserChart">Dashboard</a>
                <a class="nav-item nav-link" href="home">Home</a>
                <a class="nav-item nav-link" href="userlist">User List</a>
                <a class="nav-item nav-link" href="#">Settings</a>
            </nav>
        </div>

        <!-- Page Content -->
        <div id="content">
            <div class="container mt-4">
                <h2>Admin Dashboard</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div id="statusPieChart" style="height: 500px;"></div>
                    </div>
                    <div class="col-md-6">
                        <div id="rolePieChart" style="height: 500px;"></div>
                    </div>
                </div>
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