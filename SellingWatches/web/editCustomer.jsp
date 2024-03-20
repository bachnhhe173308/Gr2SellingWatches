<%-- 
    Document   : editCustomer
    Created on : Feb 24, 2024, 2:54:19 PM
    Author     : THINKPAD
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="sliderstyle.css">
        <style>
            
            /* Overall styling */
            body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            color: #333;
            background-color: #f5f5f5;
            }

            .container {
            width: 80%;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            /* Heading */
            h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #222;
            }

            /* Form styling */
            .edit-customer-form {
            width: 100%;
            }

            .edit-customer-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            }

            .edit-customer-table th,
            .edit-customer-table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
            }

            .edit-customer-table th {
            background-color: #f2f2f2;
            font-weight: bold;
            }

            /* Input fields */
            input[type="text"],
            input[type="email"],
            input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 10px;
            }

            /* Gender radio buttons */
            .gender-radio-group {
            margin-bottom: 10px;
            }

            .gender-radio-group label {
            margin-right: 10px;
            }

            /* Status checkbox */
            .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
            }

            .switch input {
            opacity: 0;
            width: 0;
            height: 0;
            }

            .sliderCheckBox {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            border-radius: 20px;
            transition: 0.4s;
            }

            .sliderCheckBox:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            border-radius: 50%;
            transition: 0.4s;
            }

            input:checked + .sliderCheckBox {
            background-color: #2196F3;
            }

            input:checked + .sliderCheckBox:before {
            transform: translateX(26px);
            }

            /* Submit button */
            .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            }




        </style>
    </head>
    <body>


        <div class="container">
            <h1>EDIT CUSTOMER ID: ${requestScope.customerGetFromID.getUserID()}</h1>

            <form action="EditCustomer?CusID=${requestScope.customerGetFromID.getUserID()}" method="POST" class="edit-customer-form">
                <table class="edit-customer-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" value="${requestScope.customerGetFromID.getUserID()}" name="UserID" readonly>
                            </td>
                            <td>
                                <input type="text" value="${requestScope.customerGetFromID.getFullname()}" name="Fullname">
                            </td>
                            <td>
                                <div class="gender-radio-group">
                                    <input type="radio" name="gender" value="false" id="maleRadio" <c:if test="${'false' eq customerGetFromID.isGender()}">checked="checked"</c:if>>
                                        <label for="maleRadio">Male</label><br>
                                        <input type="radio" name="gender" value="true" id="femaleRadio" <c:if test="${'true' eq customerGetFromID.isGender()}">checked="checked"</c:if>>
                                        <label for="femaleRadio">Female</label>
                                    </div>
                                </td>
                                <td>
                                    <input type="text" value="${requestScope.customerGetFromID.getMail()}" name="Mail" readonly>
                            </td>
                            <td>
                                <input type="text" value="${requestScope.customerGetFromID.getPhone()}" name="Phone">
                            </td>
                            <td>
                                <label class="switch">
                                    <input type="checkbox" name="CusStatus" value="checked" <c:if test="${requestScope.customerGetFromID.isUserStatus() eq true}">checked</c:if>  id="statusCheckbox">
                                    <span class="sliderCheckBox round"></span>
                                </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="Submit" class="submit-btn">
            </form>
        </div>
    </body>
</html>
