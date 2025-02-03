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
$tapWater1['Excellent'] = SurveyRepository::countNumAnswers(1,1, 'Excellent');
$tapWater1['Good'] = SurveyRepository::countNumAnswers(1,1, 'Good');
$tapWater1['Fair'] = SurveyRepository::countNumAnswers(1,1, 'Fair');
$tapWater1['Poor'] = SurveyRepository::countNumAnswers(1,1, 'Poor');
$tapWater2['UnusualTaste'] = SurveyRepository::countNumAnswers(1,2, 'Unusual taste');
$tapWater2['UnusualOdor'] = SurveyRepository::countNumAnswers(1,2, 'Unusual odor');
$tapWater2['NoIssues'] = SurveyRepository::countNumAnswers(1,2, 'No issues');
$tapWater3['Always'] = SurveyRepository::countNumAnswers(1,3, 'Always');
$tapWater3['Often'] = SurveyRepository::countNumAnswers(1,3, 'Often');
$tapWater3['Sometimes'] = SurveyRepository::countNumAnswers(1,3, 'Sometimes');
$tapWater3['Rarely'] = SurveyRepository::countNumAnswers(1,3, 'Rarely');
$tapWater3['Never'] = SurveyRepository::countNumAnswers(1,3, 'Never');
$filtrationSystem1['Yes'] = SurveyRepository::countNumAnswers(1,4, 'Yes');
$filtrationSystem1['No'] = SurveyRepository::countNumAnswers(1,4, 'No');
$natBod1['Never'] = SurveyRepository::countNumAnswers(2,23, 'Never');
$natBod1['Rarely'] = SurveyRepository::countNumAnswers(2,23, 'Rarely');
$natBod1['Sometimes'] = SurveyRepository::countNumAnswers(2,23, 'Sometimes');
$natBod1['Often'] = SurveyRepository::countNumAnswers(2,23, 'Often');
$natBod1['veryOften'] = SurveyRepository::countNumAnswers(2,23, 'Very often');
$natBod2['extImportant'] = SurveyRepository::countNumAnswers(2,24, 'Extremely important');
$natBod2['veryImportant'] = SurveyRepository::countNumAnswers(2,24, 'Very important');
$natBod2['modImportant'] = SurveyRepository::countNumAnswers(2,24, 'Moderately important');
$natBod2['slightlyImportant'] = SurveyRepository::countNumAnswers(2,24, 'Slightly important');
$natBod2['notImportant'] = SurveyRepository::countNumAnswers(2,24, 'Not important at all');
$natBod3['Yes'] = SurveyRepository::countNumAnswers(2,25, 'Yes');
$natBod3['No'] = SurveyRepository::countNumAnswers(2,25, 'No');
$natBod4['cleanUpDrives'] = SurveyRepository::countNumAnswers(2,26, 'Clean-up Drives');
$natBod4['treePlanting'] = SurveyRepository::countNumAnswers(2,26, 'Tree planting');
$natBod4['advocacyCampaigns'] = SurveyRepository::countNumAnswers(2,26, 'Advocacy campaigns');
$natBod4['waterMonitoring'] = SurveyRepository::countNumAnswers(2,26, ' Water monitoring');
$natBod4['Other'] = SurveyRepository::countNumAnswers(2,26, 'Other');
$natBod5['stronglyAgree'] = SurveyRepository::countNumAnswers(2,27, 'Strongly agree');
$natBod5['Agree'] = SurveyRepository::countNumAnswers(2,27, 'Agree');
$natBod5['Neutral'] = SurveyRepository::countNumAnswers(2,27, 'Neutral');
$natBod5['Disagree'] = SurveyRepository::countNumAnswers(2,27, 'Disagree');
$natBod5['stronglyDisagree'] = SurveyRepository::countNumAnswers(2,27, 'Strongly disagree');
$survey1['tap1'] = $tapWater1;
$survey1['tap2'] = $tapWater2;
$survey1['tap3'] = $tapWater3;
$survey1['tap4'] = $filtrationSystem1;
$survey2['nat1'] = $natBod1;
$survey2['nat2'] = $natBod2;
$survey2['nat3'] = $natBod3;
$survey2['nat4'] = $natBod4;
$survey2['nat5'] = $natBod5;


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

if (isset($_GET['waterSurvey1'])) {
    $questions = Model\SurveyRepository::getQuestionsBySurveyId(1);
    $description =Model\SurveyRepository::getTextFromSurveyId(1);
    $title = Model\SurveyRepository::getTitleFromSurveyId(1);
    echo $template->render('survey', [
        'questions' => $questions,
        'nSurvey' => 1,
        'description' => $description,
        'title' => $title
    ]);
    exit(0);
}
else if (isset($_GET['waterSurvey2'])) {
    $questions = Model\SurveyRepository::getQuestionsBySurveyId(2);
    $description =Model\SurveyRepository::getTextFromSurveyId(2);
    $title = Model\SurveyRepository::getTitleFromSurveyId(2);
    echo $template->render('survey', [
        'questions' => $questions,
        'nSurvey' => 2,
        'description' => $description,
        'title' => $title
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

if (isset($_GET['action'])) {
    if (($_GET['action']) == 'logout') {
        Authenticator::logout();
        $displayed_name = null;
        echo $template->render('dashboard',[
            'displayedName' => $displayed_name,
            'survey1' => $survey1,
            'survey2' => $survey2,
        ]);
        exit(0);
    }
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
    if (isset($_POST['surveySubmit'])) {
        $nsurvey =$_POST['surveySubmit'];
        if (isset($_POST['location'])){
            $location = isset($_POST['location']) ? trim($_POST['location']) : '';
            SurveyRepository::addAnswer(1,7, $location,$user['id']);
        }
        $questions = Model\SurveyRepository::getQuestionsBySurveyId($nsurvey);
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

                SurveyRepository::addAnswer($nsurvey, $questionId, $responses[$questionId], $user['id']);
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
        $isSolved= Model\SurveyRepository::HasDoneSurveyById($user['id'],1);
        $isSolved1= Model\SurveyRepository::HasDoneSurveyById($user['id'],2);

        echo $template->render('dashboard', [
            'displayedName' => $displayed_name,
            'isSolved' => $isSolved,
            'isSolved1' => $isSolved1,
            'survey1' => $survey1,
            'survey2' => $survey2,
        ]);
        exit(0);
    }
    if(isset($user['name'])){
        $isSolved= Model\SurveyRepository::HasDoneSurveyById($user['id'],1);
        $isSolved1= Model\SurveyRepository::HasDoneSurveyById($user['id'],2);
        echo $template->render('dashboard', [
            'displayedName' => $displayed_name,
            'isSolved' => $isSolved,
            'isSolved1' => $isSolved1,
            'survey1' => $survey1,
            'survey2' => $survey2,
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
            'isSolved' => false,
            'isSolved1' => false,
            'survey1' => $survey1,
            'survey2' => $survey2,
        ]);
    exit(0);
}


