<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create New Post</title>
        <link href="css/style3.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <h2>Post Detail</h2>
            <form action="postdetail" method="post" enctype="multipart/form-data">
                <input type="text" name="title" placeholder="New Title" required>
                <textarea name="shortDescription" placeholder="Short Description" rows="4" required></textarea>
                <textarea name="content" placeholder="Content" rows="8" required></textarea>
                <input type="file" name="image" required>
                <button type="submit">Post</button>
            </form>
            <div id="confirmation" style="display:none">
                Your post has been created successfully. Click <a href="postlist">here</a> to continue.
            </div>
            <!-- JavaScript to show confirmation message after form submission -->
            <script>
                // Kiểm tra nếu URL có chứa thông báo thành công thì hiển thị
                if (window.location.href.indexOf("success=true") !== -1) {
                    document.getElementById("confirmation").style.display = "block";
                }
            </script>
        </div>
    </body>
</html>
