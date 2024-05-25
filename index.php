<?php
ini_set('display_errors', 1); error_reporting(E_ALL);
require_once 'vendor/autoload.php';
require_once 'conf/config.php';


use Model\UserRepository;
use League\Plates\Engine;
use Model\SurveyRepository;
use Util\Authenticator;

$template = new Engine('templates','tpl');

$name = $surname = $username = $email = $password = $dateOfBirth = $tapWater1 = $tapWater2 = $tapWater3 = $filtrationSystem1 = $filtrationSystem2 = null;
//variabili per la gestione del campo che fa vedere se il survey è già stato compilato dall'utente o no
//vanno gestite con una funzione che controlla effettivamente se il form è stato compilato dall'utente o meno
$isSolved = false;
$isSolved1 = true;
$user = Authenticator::getUser();

if ($user == null && !isset($_GET)){
    echo $template->render('dashboard'
        ,[
            'isSolved' => $isSolved,
            'isSolved1' => $isSolved1,
            'tapWater1' => $tapWater1,
            'tapWater2' => $tapWater2,
            'tapWater3' => $tapWater3,
            'filtrationSystem1' => $filtrationSystem1,
            'filtrationSystem2' => $filtrationSystem2,
        ]);
    exit(0);
}

if (isset($user['name']) && isset($user['surname'])) {
    $displayed_name = $user['name'] . ' ' . $user['surname'];
} else {
    // Gestione nel caso in cui $user['name'] o $user['surname'] siano null
    $displayed_name = '';
}

// Controlla i parametri GET uno per uno
if (isset($_GET['login'])) {
    echo $template->render('login');
    exit(0);
}
if (isset($_GET['recover-password'])) {
    echo $template->render('recover_password');
    exit(0);
}
if (isset($_GET['signUp'])) {
    echo $template->render('signUp', [
        'name' => $username,
        'surname' => $surname,
        'dateOfBirth' => $dateOfBirth,
    ]);
    exit(0);
}
if (isset($_GET['waterSurvey'])) {
    $questions = Model\SurveyRepository::getQuestionsBySurveyId(1);
    echo $template->render('survey', [
        'questions' => $questions
    ]);
    exit(0);
}
if (isset($_GET['dash'])) {
    echo $template->render('dashboard', [
        'displayedName' => $displayed_name,
        'isSolved' => $isSolved,
        'isSolved1' => $isSolved1,
        'tapWater1' => $tapWater1,
        'tapWater2' => $tapWater2,
        'tapWater3' => $tapWater3,
        'filtrationSystem1' => $filtrationSystem1,
        'filtrationSystem2' => $filtrationSystem2,
    ]);
    exit(0);
}
if(isset($user['name'])){
    echo $template->render('dashboard', [
        'displayedName' => $displayed_name,
        'isSolved' => $isSolved,
        'isSolved1' => $isSolved1,
        'tapWater1' => $tapWater1,
        'tapWater2' => $tapWater2,
        'tapWater3' => $tapWater3,
        'filtrationSystem1' => $filtrationSystem1,
        'filtrationSystem2' => $filtrationSystem2,
    ]);
    exit(0);
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

echo $template->render('dashboard');
exit(0);