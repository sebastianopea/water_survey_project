<?php
ini_set('display_errors', 1); error_reporting(E_ALL);
require_once 'vendor/autoload.php';
require_once 'conf/config.php';


use Model\UserRepository;
use League\Plates\Engine;
use Model\SurveyRepository;
use Model\VerifyCodeRepository;
use Util\Authenticator;
use Util\SendMail;

$template = new Engine('templates','tpl');
$name = $surname = $username = $email = $password = $dateOfBirth = $tapWater1 = $tapWater2 = $tapWater3 = $filtrationSystem1 = $filtrationSystem2 = null;
//variabili per la gestione del campo che fa vedere se il survey è già stato compilato dall'utente o no
//vanno gestite con una funzione che controlla effettivamente se il form è stato compilato dall'utente o meno
$isSolved = false;
$isSolved1 = true;


$user = Authenticator::getUser();
if (isset($_GET['login'])) {
    if (isset($_POST['login_attempt'])) {
        $login_fallito = true;
        echo $template->render('login', ['login_fallito' => $login_fallito]);
    } else {
        echo $template->render('login');
    }
    exit(0);
}



if ($user === false) {
    echo $template->render('login', ['login_fallito' => true]);
    exit(0);
}

if (isset($_GET['waterSurvey'])) {
    $questions = Model\SurveyRepository::getQuestionsBySurveyId(1);
    echo $template->render('survey', [
        'questions' => $questions
    ]);
    exit(0);
}
else if (isset($_GET['signUp'])) {
    echo $template->render('signUp', [
    ]);
    exit(0);
}
if (isset($user['name']) && isset($user['surname'])) {
    $displayed_name = $user['name'] . ' ' . $user['surname'];
} else {
    // Gestione nel caso in cui $user['name'] o $user['surname'] siano null
    $displayed_name = '';
}

if (isset($_POST)){
    if (isset($_POST['CreateUsername'])){
        $username = $_POST['CreateUsername'];
        $password = $_POST['CreatePassword'];
        $email = $_POST['CreateEmail'];
        $name = $_POST['CreateName'];
        $surname = $_POST['CreateSurname'];
        $dateOfBirth = $_POST['CreateDateOfBirth'];
        if(Model\UserRepository::checkUserExists($username)==null && Model\UserRepository::checkEmailExists($email)==null){
            Model\UserRepository::addUser($username,$email,$password,$name,$surname,$dateOfBirth);
            echo $template->render('login' , [
                'successful' => true,
            ]);
        }
        else {
            echo $template->render('signUp' , [
                'successful' => false,
            ]);
        }
        exit(0);
    }
    if (isset($_POST['location'])) {
        $test=true;
        $location = isset($_POST['location']) ? trim($_POST['location']) : '';
        SurveyRepository::addAnswer(1,7, $location,$user['id']);

        $questions=SurveyRepository::getAllQuestions();
        // Inizializza un array per le risposte
        $responses = [];

        // Itera attraverso le domande
        foreach ($questions as $question) {
            $questionId = $question['id'];
            $responseKey = 'question_' . $questionId;

            if ($questionId!=7) {
                // Gestisci altri tipi di risposte
                if (isset($_POST[$responseKey])) {
                    $responses[$questionId] = $_POST[$responseKey];

                    // Se è un array (checkbox), usa `implode` per convertirlo in una stringa
                    if (is_array($responses[$questionId])) {
                        $responses[$questionId] = implode(',', $responses[$questionId]);
                    } else {
                        // Rimuovi spazi bianchi dalle risposte singole
                        $responses[$questionId] = trim($responses[$questionId]);
                    }
                } else {
                    // Valore predefinito per risposte mancanti
                    $responses[$questionId] = '';
                }

                SurveyRepository::addAnswer(1, $questionId, $responses[$questionId], $user['id']);
            }
        }

        echo $template->render('completedSurvey', [
        ]);
        exit(0);
    }
// Controlla i parametri GET uno per uno
    if (isset($_GET['recover-password'])) {
        echo $template->render('recover_password');
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

    if (isset($_POST['recover_password_email'])) {
        $email = $_POST['recover_password_email'];
        $userInfo = UserRepository::getUserFromMail($email);
        if ($userInfo != null) {
            $rand = rand(100000, 999999);
            $message = 'To recover your password use this code: ' . $rand;
            $name = $userInfo['name'];
            Util\SendMail::sendMailToRecoverPassword($message, $email, $name);
            \Model\VerifyCodeRepository::addVerifyCode($userInfo['id'],$rand);
            echo $template->render('verify_code', [
                'email' => $email,
            ]);
            exit(0);
        } else {
            echo $template->render('recover_password', [
                'error' => true
            ]);
            exit(0);
        }
    }

    if (isset($_POST['verify_code_number'])) {
        $number = $_POST['verify_code_number'];
        $email = $_POST['verify_code_email'];
        $userInfo = UserRepository::getUserFromMail($email);
        if (VerifyCodeRepository::checkCode($userInfo['id'], $number)) {
            echo $template->render('new_password', [
                'email' => $email
            ]);
        } else {
            echo $template->render('verify_code', [
                'error' => true,
                'email' => $email
            ]);
        }
        exit(0);
    }

    if (isset($_POST['new_password_password'])) {
        $password = $_POST['new_password_password'];
        $confirmPassword = $_POST['new_password_confirm_password'];
        $email = $_POST['new_password_email'];
        if ($password != $confirmPassword or strlen($password) < 8) {
            echo $template->render('new_password', [
                'error' => 'Passwords do not match.',
                'email' => $email
            ]);
            exit(0);
        }
        UserRepository::changePassword($email, $password);
        echo $template->render('login', [
            'changed' => true
        ]);
        exit(0);
    }
}
if ($user == null){
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



echo $template->render('dashboard');
exit(0);