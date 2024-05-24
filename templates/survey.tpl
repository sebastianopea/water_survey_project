<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>water survey</title>
</head>
<body>
    <h2>Questions</h2>
    <?php foreach($questions as $q):?>
        <p><?=$q['questionText']?></p><br>
        <?php for($i = 0; $i < 6; $i++):?>
            <input type="radio" name="<?=$q['questionText']?>">
        <?php endfor;?>
    <?php endforeach;?>

</body>
</html>