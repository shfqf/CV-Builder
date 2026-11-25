<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title> Validation Error </title>
    <style>
        body { font-family: Arial, sans-serif; padding: 40px; background: #f8f9fa; }
        .error-box {
            max-width: 550px;
            margin: auto;
            background: #fff;
            border-left: 5px solid #dc3545;
            padding: 24px;
            border-radius: 6px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        h2 { color: #dc3545; margin-top: 0; }
        .msg { white-space: pre-line; margin: 16px 0; color: #333; }
        .btn {
            display: inline-block;
            padding: 10px 18px;
            background: #0d6efd;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h2> Form Submission Failed </h2>
        <div class="msg">
            <%
                String errMsg = (String) request.getAttribute("ERROR MESSAGE!");
                if (errMsg != null) 
                {
                    out.print(errMsg);
                } 
                else 
                {
                    out.print("Please fill in all mandatory fields.");
                }
            %>
        </div>
        <a href="cvForm.jsp" class="btn">
            Back to Form
        </a>
    </div>
</body>
</html>