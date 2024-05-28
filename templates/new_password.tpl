<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form method="post" onsubmit="return checkPassword()">
    <input type="hidden" name="new_password_email" value="<?=$email?>">
    <input type="password" placeholder="New password" name="new_password_password" id="password">
    <input type="password" placeholder="Confirm password" name="new_password_confirm_password" id="confirm-password">
    <input type="submit">
</form>

<script>
    function checkPassword() {
        let password = document.getElementById('password').value;
        let confirm_password = document.getElementById('confirm-password').value;

        // Verifica lunghezza minima di 8 caratteri
        if (password.length < 8) {
            alert('Password must be at least 8 characters long');
            return false;
        }

        // Verifica corrispondenza delle password
        if (password !== confirm_password) {
            alert('Passwords don\'t match');
            return false;
        }

        return true;
    }
</script>

</body>
</html>