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

create table options
(
    id         int unsigned auto_increment
        primary key,
    surveyId   int unsigned null,
    questionId int unsigned null,
    optionText varchar(100) null,
    constraint questionId_fk
        foreign key (questionId) references questions (id),
    constraint surveyId_fk
        foreign key (surveyId) references survey (id)
)
    charset = utf8mb4;

create index questionId
    on options (questionId);

create index surveyId
    on options (surveyId);

create table user
(
    name        varchar(100) null,
    surname     varchar(100) null,
    username    varchar(100) null,
    email       varchar(100) null,
    dateOfBirth date         null,
    id          int unsigned auto_increment
        primary key,
    password    varchar(255) null
);

create table answers
(
    id             int unsigned auto_increment
        primary key,
    survey_Id      int unsigned null,
    question_Id    int unsigned null,
    selectedOption varchar(100) not null,
    user_id        int unsigned not null,
    constraint question_Id
        foreign key (question_Id) references questions (id),
    constraint survey_Id
        foreign key (survey_Id) references survey (id),
    constraint user_id
        foreign key (user_id) references user (id)
);

create table temporany_code
(
    id      int unsigned auto_increment
        primary key,
    id_user int unsigned null,
    code    varchar(255) null,
    time    timestamp    null,
    constraint id_user
        foreign key (id_user) references user (id)
);


