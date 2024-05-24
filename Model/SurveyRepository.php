<?php

namespace Model;
use Util\Connection;

class SurveyRepository{
    public static function addAnsware($location, $comments, $question1, $question2, $question3, $question4){
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO options() VALUES()';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'location' => $location,
            'comments' => $comments,
            'question1' => $question1,
            'question2' => $question2,
            'question3' => $question3,
            'question4' => $question4
        ]);
    }
}