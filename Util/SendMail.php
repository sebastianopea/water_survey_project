<?php

namespace Util;
use PHPMailer\PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

class SendMail
{
    public static function sendMailToRecoverPassword($message, $emailDest, $username):bool{
        $mail = new PHPMailer();
        $mail->isSMTP();
        $mail->SMTPDebug = SMTP::DEBUG_SERVER;
        $mail->Host = 'smtp.gmail.com';
        $mail->Port = 465;
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->SMTPAuth = true;
        $mail->Username = MAIL;


        $mail->Password = PASSWORD_MAIL;

        $mail->setFrom(MAIL, 'Water survey service');
        $mail->addReplyTo(MAIL, 'Water survey service');

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