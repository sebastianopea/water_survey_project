<?php
ini_set('display_errors', 1); error_reporting(E_ALL);
require_once '../vendor/autoload.php';
require_once '../conf/config.php';


use Model\UserRepository;
use League\Plates\Engine;
use Model\SurveyRepository;
use Util\Authenticator;
use Util\SendMail;

SendMail::sendMailToRecoverPassword('ciao', 'peasebastiano@gmail.com', 'ciao');