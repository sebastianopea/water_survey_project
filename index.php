<?php

require_once 'vendor/autoload.php';
require_once 'conf/config.php';


use Model\UserRepository;
use League\Plates\Engine;
use Model\SurveyRepository;
use Util\Authenticator;

$template = new Engine('templates','tpl');

$name = $surname = $username = $email = $password = $dateOfBirth = $tapWater1 = $tapWater2 = $tapWater3 = $filtrationSystem1 = $filtrationSystem2 = null;


if (isset($_GET)){
    if (isset($_GET['recover-password'])) {
        echo $template->render('recover_password');
        exit(0);
    }
    if (isset($_GET['signUp'])){
        echo $template->render('signUp', [
            'name' => $username,
            'surname' => $surname,
            'dateOfBirth' => $dateOfBirth,
        ]);
        exit(0);
    }
    if (isset($_GET['waterSurvey'])){
        $questions =Model\SurveyRepository::getQuestionsBySurveyId(1);
        echo $template->render('survey', [
            'questions' =>$questions
        ]);
        exit(0);
    }
    if (isset($_GET['dash'])) {
        echo $template->render('dashboard',[
            'tapWater1' => $tapWater1,
            'tapWater2' => $tapWater2,
            'tapWater3' => $tapWater3,
            'filtrationSystem1' => $filtrationSystem1,
            'filtrationSystem2' => $filtrationSystem2,
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
    if (isset($_POST['username'])){
        $username = $_POST['username'];
        $password = $_POST['password'];
        $email = $_POST['email'];
        $name = $_POST['name'];
        $surname = $_POST['surname'];
        $dateOfBirth = $_POST['dateOfBirth'];
        if(!Model\UserRepository::checkUserExists($username)){
            Model\UserRepository::createNewUser($username, $email, $password, $name, $surname, $dateOfBirth);
            echo $template->render('login' , [
                'successful' => false,
            ]);
        }
        else {
            echo $template->render('signUp' , [
                'successful' => true,
            ]);
        }
        exit(0);
    }
    if (isset($_POST['Submit_Survey'])) {
        $location = $_POST['location'];
        $comments = $_POST['comments'];
        $tapWater1 = $_POST['question_1'];
        $tapWater2 = $_POST['question_2'];
        $tapWater3 = $_POST['question_3'];
        $filtrationSystem1 = $_POST['question_4'];
        $filtrationSystem2 = $_POST['question_5'];
        SurveyRepository::addAnswer($location, $comments, $tapWater1, $tapWater2, $tapWater3, $filtrationSystem1, $filtrationSystem2);
    }
    if (isset($_POST['recover_password_email'])) {
        $email = $_POST['recover_password_email'];
        if (UserRepository::mailExists($email)) {
            $rand = rand(100000, 999999);
            $message = 'To recover your password use this code: ' . $rand;
            $name = UserRepository::getUserFromEmail($email);
            Util\SendMail::sendMailToRecoverPassword($message, $email, $name);
            UserRepository::insertCodeVerify($email, $rand);
            echo $template->render('verify_code', [
                'email' => $email,
            ]);
            exit(0);
        } else {
            echo $template->render('recover_password', [
                'error' => 'Email not found.'
            ]);
            exit(0);
        }
    }

    if (isset($_POST['verfy_code_number'])) {
        $number = $_POST['verfy_code_number'];
        $email = $_POST['verify_code_email'];
        if (UserRepository::verifyCode($email, $number)) {
            echo $template->render('new_password', [
                'email' => $email
            ]);
            exit(0);
        } else {
            echo $template->render('verify_code', [
                'error' => 'Invalid verification code.',
                'email' => $email
            ]);
            exit(0);
        }
    }

    if (isset($_POST['new_password_password'])) {
        $password = $_POST['new_password_password'];
        $confirmPassword = $_POST['new_password_confirm_password'];
        $email = $_POST['new_password_email'];
        if ($password != $confirmPassword) {
            echo $template->render('new_password', [
                'error' => 'Passwords do not match.',
                'email' => $email
            ]);
            exit(0);
        }
        UserRepository::changePassword($email, $password);
        echo $template->render('login', [
            'message' => 'Password successfully changed.'
        ]);
        exit(0);
    }
}
/*if (isset($_POST)){
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
                    ''
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
**/
echo $template->render('login', [

]);