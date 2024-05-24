<?php

namespace Model;
use Util\Connection;

class SurveyRepository{
    public static function addAnswer($location, $comments, $tapWater1, $tapWater2, $tapWater3, $filtrationSystem1, $filtrationSystem2): void
    {
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO options() VALUES()';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'location' => $location,
            'comments' => $comments,
            'tapWater1' => $tapWater1,
            'tapWater2' => $tapWater2,
            'tapWater3' => $tapWater3,
            'filtrationSystem1' => $filtrationSystem1,
            'filtrationSystem2' => $filtrationSystem2,
        ]);
    }

    public static function getAllSurveys(): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM survey';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getSurveyById(int $id): ?array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM survey WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch();
    }

    public static function getAllTypeOfQuestions(): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM typeofquestion';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getTypeOfQuestionById(int $id): ?array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM typeofquestion WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch();
    }

    public static function getAllQuestions(): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM questions';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getQuestionById(int $id): ?array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM questions WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch();
    }

    public static function getQuestionsBySurveyId(int $surveyId): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM questions WHERE surveyId = :surveyId';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['surveyId' => $surveyId]);
        return $stmt->fetchAll();
    }

    public static function getAllOptions(): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM options';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getOptionById(int $id): ?array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM options WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch();
    }

    public static function getOptionsByQuestionId(int $questionId): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM options WHERE questionId = :questionId';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['questionId' => $questionId]);
        return $stmt->fetchAll();
    }
}