<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';

use Model\UserRepository;
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
            echo $template->render('singUp', [
                    'name' => $username,
                    'surname' => $surname,
                    'dateOfBirth' => $dateOfBirth,
                ]);
            exit(0);
        }
        else
        {
            echo $template->render('login');
            exit(0);
        }
    }
    if (isset($_POST['Submit_Survey'])){
        $location = $_POST['location'];
        $comments = $_POST['comments'];
        $question1 = $_POST['question_1'];
        $question2 = $_POST['question_2'];
        $question3 = $_POST['question_3'];
        $question4 = $_POST['question_4'];
    }

}

echo $template->render('login', [

]);