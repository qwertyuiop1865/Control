-- Создание таблицы Должность
CREATE TABLE Должность (
    Код_должности INTEGER PRIMARY KEY,
    Наименование VARCHAR(100) NOT NULL
);

-- Создание таблицы Кафедра
CREATE TABLE Кафедра (
    Код_кафедры INTEGER PRIMARY KEY,
    Наименование VARCHAR(100) NOT NULL
);

-- Создание таблицы Преподаватели
CREATE TABLE Преподаватели (
    Код_преподавателя INTEGER PRIMARY KEY,
    ФИО VARCHAR(150) NOT NULL,
    Телефон VARCHAR(20),
    Код_кафедры INTEGER REFERENCES Кафедра(Код_кафедры),
    Код_должности INTEGER REFERENCES Должность(Код_должности)
);

-- Создание таблицы Дисциплины
CREATE TABLE Дисциплины (
    Код_дисциплины INTEGER PRIMARY KEY,
    Наименование VARCHAR(100) NOT NULL
);

-- Создание таблицы Группа
CREATE TABLE Группа (
    Код_группы INTEGER PRIMARY KEY,
    Наименование VARCHAR(50) NOT NULL
);

-- Создание таблицы Аудитория
CREATE TABLE Аудитория (
    Код_аудитории INTEGER PRIMARY KEY,
    Наименование VARCHAR(50) NOT NULL
);

-- Создание таблицы Тип_занятия
CREATE TABLE Тип_занятия (
    Код_типа INTEGER PRIMARY KEY,
    Наименование VARCHAR(50) NOT NULL
);

-- Создание таблицы Критерии_проверки
CREATE TABLE Критерии_проверки (
    Код_критерия INTEGER PRIMARY KEY,
    Наименование VARCHAR(100) NOT NULL
);

-- Создание таблицы Нормы_качества
CREATE TABLE Нормы_качества (
    Код_нормы INTEGER PRIMARY KEY,
    Наименование VARCHAR(100) NOT NULL,
    Норма NUMERIC,
    Код_критерия INTEGER REFERENCES Критерии_проверки(Код_критерия)
);

-- Создание таблицы Занятия
CREATE TABLE Занятия (
    Код_занятия INTEGER PRIMARY KEY,
    Дата_проведения DATE NOT NULL,
    Код_дисциплины INTEGER REFERENCES Дисциплины(Код_дисциплины),
    Код_преподавателя INTEGER REFERENCES Преподаватели(Код_преподавателя),
    Код_группы INTEGER REFERENCES Группа(Код_группы),
    Код_аудитории INTEGER REFERENCES Аудитория(Код_аудитории),
    Код_типа INTEGER REFERENCES Тип_занятия(Код_типа)
);

-- Создание таблицы Оценка_преподавателя
CREATE TABLE Оценка_преподавателя (
    Номер SERIAL PRIMARY KEY,
    Дата_оценки DATE NOT NULL,
    Код_занятия INTEGER REFERENCES Занятия(Код_занятия),
    Код_нормы INTEGER REFERENCES Нормы_качества(Код_нормы),
    Оценка INTEGER,
    Примечание TEXT
);



INSERT INTO Должность (Код_должности, Наименование) VALUES
(1, 'Профессор'),
(2, 'Доцент'),
(3, 'Старший преподаватель'),
(4, 'Ассистент');

-- Заполнение таблицы Кафедра
INSERT INTO Кафедра (Код_кафедры, Наименование) VALUES
(1, 'Информационных систем'),
(2, 'Математических дисциплин'),
(3, 'Базовая кафедра ИТ'),
(4, 'Технологий ИИ');

-- Заполнение таблицы Дисциплины
INSERT INTO Дисциплины (Код_дисциплины, Наименование) VALUES
(1, 'Базы данных'),
(2, 'Математический анализ'),
(3, 'Программирование'),
(4, 'Физика');

-- Заполнение таблицы Группа
INSERT INTO Группа (Код_группы, Наименование) VALUES
(1, 'ИТ-101'),
(2, 'МА-201'),
(3, 'ФИЗ-301'),
(4, 'ЭК-401');

-- Заполнение таблицы Аудитория
INSERT INTO Аудитория (Код_аудитории, Наименование) VALUES
(1, '301'),
(2, '302'),
(3, '303'),
(4, '304');

-- Заполнение таблицы Тип_занятия
INSERT INTO Тип_занятия (Код_типа, Наименование) VALUES
(1, 'Лекция'),
(2, 'Практика'),
(3, 'Лабораторная работа'),
(4, 'Семинар');

-- Заполнение таблицы Критерии_проверки
INSERT INTO Критерии_проверки (Код_критерия, Наименование) VALUES
(1, 'Качество подготовки материала'),
(2, 'Доступность изложения'),
(3, 'Использование современных технологий'),
(4, 'Вовлеченность студентов');

-- Заполнение таблицы Преподаватели
INSERT INTO Преподаватели (Код_преподавателя, ФИО, Телефон, Код_кафедры, Код_должности) VALUES
(1, 'Иванов Петр Сергеевич', '+7-911-123-45-67', 1, 1),
(2, 'Петрова Анна Михайловна', '+7-912-234-56-78', 2, 2),
(3, 'Сидоров Игорь Владимирович', '+7-913-345-67-89', 1, 2),
(4, 'Козлова Мария Андреевна', '+7-914-456-78-90', 3, 3),
(5, 'Морозов Андрей Петрович', '+7-915-567-89-01', 4, 1),
(6, 'Волкова Елена Дмитриевна', '+7-916-678-90-12', 2, 2),
(7, 'Соколов Дмитрий Иванович', '+7-917-789-01-23', 1, 3),
(8, 'Новикова Ольга Александровна', '+7-918-890-12-34', 3, 2),
(9, 'Попов Александр Николаевич', '+7-919-901-23-45', 4, 1),
(10, 'Лебедева Татьяна Сергеевна', '+7-920-012-34-56', 2, 3);

-- Заполнение таблицы Нормы_качества
INSERT INTO Нормы_качества (Код_нормы, Наименование, Норма, Код_критерия) VALUES
(1, 'Высокий уровень подготовки', 9.5, 1),
(2, 'Средний уровень подготовки', 7.5, 1),
(3, 'Доступное объяснение материала', 9.0, 2),
(4, 'Использование презентаций', 8.5, 3),
(5, 'Интерактивное взаимодействие', 9.0, 4),
(6, 'Качество практических заданий', 8.0, 1),
(7, 'Организация групповой работы', 8.5, 4),
(8, 'Использование онлайн-ресурсов', 8.0, 3),
(9, 'Четкость изложения', 9.0, 2),
(10, 'Обратная связь со студентами', 8.5, 4);

-- Заполнение таблицы Занятия
INSERT INTO Занятия (Код_занятия, Дата_проведения, Код_дисциплины, Код_преподавателя, Код_группы, Код_аудитории, Код_типа) VALUES
(1, '2024-01-10', 1, 1, 1, 1, 1),
(2, '2024-01-11', 2, 2, 2, 2, 2),
(3, '2024-01-12', 3, 3, 3, 3, 3),
(4, '2024-01-13', 4, 4, 4, 4, 1),
(5, '2024-01-14', 1, 5, 1, 1, 2),
(6, '2024-01-15', 2, 6, 2, 2, 3),
(7, '2024-01-16', 3, 7, 3, 3, 1),
(8, '2024-01-17', 4, 8, 4, 4, 2),
(9, '2024-01-18', 1, 9, 1, 1, 3),
(10, '2024-01-19', 2, 10, 2, 2, 1);

-- Заполнение таблицы Оценка_преподавателя
INSERT INTO Оценка_преподавателя (Дата_оценки, Код_занятия, Код_нормы, Оценка, Примечание) VALUES
('2024-01-10', 1, 1, 9, 'Отличная подготовка к занятию'),
('2024-01-11', 2, 2, 8, 'Хорошее владение материалом'),
('2024-01-12', 3, 3, 9, 'Понятное объяснение сложных концепций'),
('2024-01-13', 4, 4, 7, 'Требуется больше практических примеров'),
('2024-01-14', 5, 5, 8, 'Активное вовлечение студентов'),
('2024-01-15', 6, 6, 9, 'Качественные практические задания'),
('2024-01-16', 7, 7, 8, 'Эффективная работа в группах'),
('2024-01-17', 8, 8, 9, 'Современные методы обучения'),
('2024-01-18', 9, 9, 8, 'Структурированная подача материала'),
('2024-01-19', 10, 10, 9, 'Отличная обратная связь');