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
    <h2>Create a new account</h2>
    <form name="signUp" method="post">
        <input type="text" placeholder="E-mail">
        <input type="text" placeholder="Username">
        <input type="text" placeholder="Password">
        <input type="text" placeholder="Name" value="<?=$name?>">
        <input type="text" placeholder="Surname" value="<?=$surname?>">
        <input type="date" placeholder="Birth date" value="<?=$dateOfBirth?>">
        <input type="submit" name="Send">
    </form>
    <label> if you already have an account <a href="index.php?login">Log in</a></label>
</body>
</html>