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
    public static function creteNewUser($username, $email, $password, $name, $surname, $dateOfBirth):bool
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

}