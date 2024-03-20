<%-- 
    Document   : editSlider
    Created on : Feb 22, 2024, 7:32:19 AM
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
            /* Global styles */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            /* Table styles */
            .table {
                width: 100%;
                border-collapse: collapse;
            }
            .table th,
            .table td {
                padding: 8px 16px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .table th {
                font-weight: bold;
            }

            .table tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Form styles */
            .form {
                margin-top: 20px;
            }

            .form-group {
                margin-bottom: 10px;
            }

            .label {
                display: block;
                margin-bottom: 5px;
            }

            .input-field {
                width: 100%;
                padding: 8px 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .submit-btn {
                cursor: pointer;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 8px 16px;
                font-size: 16px;
                font-weight: bold;
            }

            .submit-btn:hover {
                background-color: #0069d9;
            }

            /* Image styles */
            .img-in-slider-list img {
                max-width: 100px;
                max-height: 100px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            /* Switch styles */
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider-checkbox {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider-checkbox:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .switch input:checked + .slider-checkbox {
                background-color: #2196f3;
            }

            .switch input:checked + .slider-checkbox:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Media queries */
            @media (max-width: 768px) {
                .container {
                    max-width: 100%;
                }
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h1>EDIT SLIDER ID: ${requestScope.sliderGetFromID.getSliderID()}</h1>

            <form action="EditSlider?SliderID=${requestScope.sliderGetFromID.getSliderID()}" method="POST" class="form" enctype="multipart/form-data">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Slide ID</th>
                            <th>User ID</th>
                            <th>Title</th>
                            <th>Image</th>
                            <th>Backlink</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" value="${requestScope.sliderGetFromID.getSliderID()}" name="SliderID" readonly>
                            </td>
                            <td>
                                <input type="text" value="${requestScope.sliderGetFromID.getUserID()}" name="UserID" readonly>
                            </td>
                            <td>
                                <input type="text" value="${requestScope.sliderGetFromID.getSliderTitle()}" name="SliderTitle">
                            </td>
                            <td>
                                <div class="img-in-slider-list">
                                    <img src="${requestScope.sliderGetFromID.getSliderImage()}" alt="alt">
                                    <br>
<!--                                    <input type="text" value="${requestScope.sliderGetFromID.getSliderImage()}" name="SliderImage">-->
                                    <label for="sliderImage">Select image to upload:</label>
                                    <input type="file" name="sliderImage-upload" id="sliderImage-upload" class="form-control-file" required="">
                                </div>
                            </td>
                            <td>
                                <input type="text" value="${requestScope.sliderGetFromID.getBacklink()}" name="Backlink">
                            </td>
                            <td>
                                <label class="switch">
                                    <input type="checkbox" name="SliderStatus" value="checked" <c:if test="${requestScope.sliderGetFromID.isSliderStatus() eq true}">checked</c:if>>
                                    <span class="slider-checkbox round"></span>
                                </label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="submit-btn">Submit</button>
            </form>
        </div>
    </body>
</html>
