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
<h1>verify code</h1>
<form action="" method="post">
    <input type="hidden" value="<?=$email?>" name="verify_code_email">
    <input type="number" name="verify_code_number">
    <input type="submit">
</form>
</body>
</html>