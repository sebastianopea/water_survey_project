<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use League\Plates\Engine;
use Model\SurveyRepository;
use Util\Authenticator;

$template = new Engine('templates','tpl');

$name = $surname = $username = $email = $password = $dateOfBirth = null;

if (isset($_GET)){
    if (isset($_GET['signUp'])){
        echo $template->render('signUp', [
            'name' => $username,
            'surname' => $surname,
            'dateOfBirth' => $dateOfBirth,
        ]);
        exit(0);
    }
    if (isset($_GET['login'])){
        echo $template->render('login', [

        ]);
        exit(0);
    }
}
if (isset($_POST)){
    if (isset($_POST['signUp'])){
        $name = $_POST['name'];
        $surname = $_POST['surname'];
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $dateOfBirth = $_POST['dateOfBirth'];


        if (!\Model\UserRepository::createNewUser($username, $email, $password, $name, $surname, $dateOfBirth) || strlen($password) < 8) {
            $error = "E-mail or username already used or password doesn't contain at least 8 characters";
            echo $template->render('singUp', [
                    'name' => $username,
                    'surname' => $surname,
                    'dateOfBirth' => $dateOfBirth,
                ]) . "<script>alert('$error');</script>";
        }
        else
        {
            echo $template->render('login') . '<script>Account created</script>';
        }
    }
}

echo $template->render('login', [

]);