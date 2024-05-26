<?php

namespace Model;
use Util\Connection;

class SurveyRepository{
    public static function addAnswer($surveyId, $location, $responses ,$user_id): void
    {
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO answers (survey_Id, question_Id, selectedOption ,user_id) VALUES (:survey_Id, :question_Id, :selectedOption ,:user_id)';

        foreach ($responses as $questionId => $response) {
            // Assumiamo che `selectedOption` sia un ID numerico delle opzioni (da modificare se necessario)
            if (is_numeric($response)) {
                $selectedOption = (int)$response;
            } else {
                // Gestisci risposte che non sono numeriche (ad esempio, textarea)
                $selectedOption = $response;
            }

        $stmt = $pdo->prepare($sql);


        $stmt->execute([
            ':survey_Id' => $surveyId,
            ':question_Id' => $questionId,
            ':selectedOption' => $selectedOption,
            ':user_id' => $user_id,
        ]);
    }
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