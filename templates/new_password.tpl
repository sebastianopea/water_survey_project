<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            position: relative;
            justify-content: center;
            align-items: center;
        }
        .reset-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        h1 {
            color: #5a9;
        }
        p {
            font-size: 1.2em;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-size: 1em;
        }
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }
        input[type="submit"] {
            background-color: #5a9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 20px auto 0;
        }
        input[type="submit"]:hover {
            background-color: #48a;
        }
        .error-message {
            background-color: #F87171;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-top: 60px;
            max-width: 400px;
            position: absolute;
            top: 67%;
            left: 50%;
            transform: translate(-50%, -67%);
        }
    </style>
</head>
<body>
<div class="reset-container">
    <h1>Reset Password</h1>
    <form id="form" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="new_password_email" value="<?=$email?>">
        <label for="password">New Password:</label>
        <input type="password" id="password" name="new_password_password" placeholder="Enter new password" required>
        <label for="confirm-password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="new_password_confirm_password" placeholder="Confirm new password" required>
        <input type="submit" value="Reset Password">
    </form>
</div>
<div class="error-message" id="password-error" style="display: none;">Passwords do not match</div>
<div class="error-message" id="password-short" style="display: none;">The password must be at least 8 characters long</div>


<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;
        var errorMessage = document.getElementById("password-error");
        var errorMessage2 = document.getElementById("password-short");

        if (password !== confirm_password) {
            errorMessage.style.display = "block";
            errorMessage2.style.display = "none";
            return false;
        }
        if (password.length<8){
            errorMessage2.style.display = "block";
            errorMessage.style.display = "none";
            return false;
        }
        return true;
    }
</script>

</body>
</html>