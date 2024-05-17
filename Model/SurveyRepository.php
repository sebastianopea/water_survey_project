<?php

namespace Model;
use Util\Connection;

class SurveyRepository{
    public static function getSurvey(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT *
        FROM watersurvey.survey';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([

            ]
        );
        return $stmt->fetchAll();
    }
}