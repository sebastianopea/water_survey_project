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

    public static function checkUserExists(string $username): ?array {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM watersurvey.user WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'username' => $username
        ]);

        // Se non esiste un utente con lo stesso nome utente, restituisci null
        if ($stmt->rowCount() == 0) {
            return null;
        }

        // Se esiste un utente con lo stesso nome utente, restituisci i dati dell'utente
        return $stmt->fetch();
    }
    public static function checkEmailExists(string $email): ?array {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM watersurvey.user WHERE email=:email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $email
        ]);

        // Se non esiste un utente con lo stesso nome utente, restituisci null
        if ($stmt->rowCount() == 0) {
            return null;
        }

        // Se esiste un utente con lo stesso nome utente, restituisci i dati dell'utente
        return $stmt->fetch();
    }
    public static function addUser($username, $email, $password, $name, $surname, $dateOfBirth):bool
    {
        $email = strtolower($email);
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


    public static function getEmails(){
        $pdo = Connection::getInstance();
        $result = $pdo->query('select email from user');
        return $result->fetchAll();
    }
    public static function getUserFromMail($email){
        $email = strtolower($email);
        $pdo = Connection::getInstance();
        $sql = 'select * from user where email = :email';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $email
        ]);
        return $stmt->fetch();
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