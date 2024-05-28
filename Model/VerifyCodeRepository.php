<?php

namespace Model;

use Util\Connection;

class VerifyCodeRepository
{
    public static function addVerifyCode($idUser, $code){
        $pdo = Connection::getInstance();
        $code = password_hash($code, PASSWORD_DEFAULT);
        $sql = 'INSERT INTO temporany_code (id_user, code, time)VALUES (:id_user, :code, NOW())';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id_user' => $idUser,
            'code' => $code,

        ]);
    }

    public static function checkCode($idUser,$code):bool{
        //delete the data which are older than 15 minutes
        $pdo = Connection::getInstance();
        $sql = 'DELETE FROM temporany_code WHERE time < DATE_SUB(NOW(), INTERVAL 15 MINUTE)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM temporany_code WHERE id_user = :id_user';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id_user' => $idUser
        ]);
        $rows = $stmt->fetchAll();
        foreach ($rows as $row) {
            if (password_verify($code, $row['code'])) {
                return true;
            }
        }
        return false;
    }


}