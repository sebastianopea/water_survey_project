<?php

namespace Model;
use Util\Connection;

class UserRepository{


    public static function userAuthentication(string $username, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM watersurvey.user WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );

        //Non esiste un utente con quello username nel database
        if($stmt->rowCount() == 0)
            return null;
        //Recupera i dati dell'utente
        $row = $stmt->fetch();
        //Verifica che la password corrisponda
        //Se non corrisponde ritorna null
        if (!password_verify($password, $row['password']))
            return null;
        //Altrimenti ritorna il vettore contenente i dati dell'utente

        return $row;
    }

    public static function existUsername($username, $email):bool
    {
        $sql = 'SELECT * FROM watersurvey.user WHERE username = :username AND email = :email';
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'username' => $username,
            'email' => $email,
        ]);
        if ($stmt->rowCount() == 0)
            return false;
        return true;
    }
    public static function createNewUser($username, $email, $password, $name, $surname, $dateOfBirth):bool
    {
         if (self::existUsername($username, $email))
             return false;
         $password = password_hash($password, PASSWORD_DEFAULT);
         $sql = 'INSERT INTO watersurvey.user (username, email, password, name, surname, dateOfBirth)
                 VALUES (:username, :email, :password, :name, :surname, :dateOfBirth)';
         $pdo = Connection::getInstance();
         $stmt = $pdo->prepare($sql);
         $stmt->execute([
             'username' => $username,
             'email' => $email,
             'password' => $password,
             'name' => $name,
             'surname' => $surname,
             'dateOfBirth' => $dateOfBirth,
         ]);
         return true;
    }
    public static function checkUserExists(string $username):bool {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM user WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'username' => $username
        ]);

        return $stmt->rowCount() > 0;
    }

    public static function getEmails(){
        $pdo = Connection::getInstance();
        $result = $pdo->query('select email from user');
        return $result->fetchAll();
    }
    public static function mailExists($email):bool{
        $pdo = Connection::getInstance();
        $sql = 'select email from user where email = :email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email', $email
        ]);
        return $stmt->rowCount() > 0;
    }

    public static function changePassword($email, $password){
        $pdo = Connection::getInstance();
        $password = password_hash($password, PASSWORD_DEFAULT);
        $sql = 'UPDATE user SET password = :password WHERE email = :email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'password' => $password,
            'email' => $email
        ]);
    }
    public static function insertCodeVerify($email, $code){
        $pdo = Connection::getInstance();
        $code = password_hash($code, PASSWORD_DEFAULT);
        $sql = 'INSERT INTO user(email, code) VALUES (:email, :code)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $email,
            'code' => $code
        ]);
    }
    public static function verifyCode($email, $code):bool{
        $pdo = Connection::getInstance();
        $code = password_hash($code, PASSWORD_DEFAULT);
        $sql = 'SELECT * FROM user WHERE email = :email AND code = :code';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $email,
            'code' => $code
        ]);
        return $stmt->rowCount() > 0;
    }
    public static function getUserFromEmail($email){
        $pdo = Connection::getInstance();
        $sql = 'SELECT username FROM user WHERE email = :email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $email
        ]);
        return $stmt->fetch();
    }
}