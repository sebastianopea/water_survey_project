create table survey
(
    id           int unsigned auto_increment
        primary key,
    title        varchar(100) null,
    description  varchar(255) null,
    creationDate date         null
);

create table typeofquestion
(
    id   int unsigned auto_increment
        primary key,
    type varchar(100) null
);

create table questions
(
    id           int unsigned auto_increment
        primary key,
    surveyId     int unsigned null,
    questionText varchar(100) null,
    questionType int unsigned null,
    constraint questionType_id
        foreign key (questionType) references typeofquestion (id),
    constraint surveyId
        foreign key (surveyId) references survey (id)
);

create table answers
(
    id             int unsigned auto_increment
        primary key,
    survey_Id      int unsigned null,
    question_Id    int unsigned null,
    selectedOption int          null,
    constraint question_Id
        foreign key (question_Id) references questions (id),
    constraint survey_Id
        foreign key (survey_Id) references survey (id)
);

create table user
(
    name        varchar(100) null,
    surname     varchar(100) null,
    username    varchar(100) null,
    email       varchar(100) null,
    dateOfBirth date         null,
    id          int unsigned auto_increment
        primary key
);

