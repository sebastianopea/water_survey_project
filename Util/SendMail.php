<?php

namespace Util;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

class SendMail
{

    const MAIL = 'verify.number.php@gmail.com';
    const NAME = 'php';
    //Password to use for SMTP authentication
    //Si veda questo link per predisporre l'indirizzo gmail
    //in modo che possa essere usato per inviare mail
    //da un'applicazione PHP
    //https://stackoverflow.com/questions/76186516/im-trying-to-make-phpmailer-work-but-it-keeps-giving-me-the-smtp-error-could-n
    const PASSWORD_MAIL = '';
    public static function sendMailToRecoverPassword($message, $emailDest, $username):bool{
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->SMTPAuth = true;
        $mail->Username = self::MAIL;


        $mail->Password = self::PASSWORD_MAIL;

        $mail->setFrom(self::MAIL, self::NAME);
        $mail->addReplyTo(self::MAIL, self::NAME);

        $mail->addAddress($emailDest, $username);

        $mail->Subject = 'Recover your password';

        $mail->Body = $message;

        if (!$mail->send()) {
            return false;
        } else {
            return true;
        }
    }
}
