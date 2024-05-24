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
    <form method="post"  onsubmit="checkPassword()">
        <input type="hidden" name="new_password_email" value="<?=$email?>">
        <input type="password" placeholder="New password" name="new_password_password" id="password">
        <input type="password" placeholder="Confirm password" name="new_password_confirm_password" id="confirm-password">
        <input type="submit">
    </form>
    <script>
         function checkPassword(){
             let password  = Document().getElementById('password');
             let confirm_password = Document().getElementById('confirm-password');
             if (password !== confirm_password){
                 alert('Passwords don\'t match');
                 return false;
             }
             return true;
         }
    </script>
</body>
</html>