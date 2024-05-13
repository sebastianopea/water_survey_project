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
    <form class="form" action="index.php" method="post">
        <input type="text" placeholder="E-mail" name="email">
        <input type="text" placeholder="Username" name="username">
        <input type="text" placeholder="Password" name="password">
        <input type="text" placeholder="Name" value="<?=$name?>" name="name">
        <input type="text" placeholder="Surname" value="<?=$surname?>" name="surname">
        <input type="date" placeholder="Birth date" value="<?=$dateOfBirth?>" name="dateOfBirth">
        <input type="submit" name="signUp">
    </form>
    <label> if you already have an account <a href="index.php?login">Log in</a></label>
</body>
</html>