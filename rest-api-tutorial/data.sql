DROP TABLE IF EXISTS author CASCADE;
DROP TABLE IF EXISTS book CASCADE;
DROP TABLE IF EXISTS book_authors CASCADE;

CREATE TABLE public.author
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    age  INT,
    is_alive BOOL,
    created_at TIMESTAMP NOT NULL DEFAULT (now() AT TIME ZONE 'utc')
);
CREATE INDEX idx_author_create_at_pagination ON public.author (created_at, id);
CREATE INDEX idx_author_age_pagination ON public.author (age, id);

INSERT INTO author (name, age, is_alive)
VALUES ('Народ', 2022, true);
INSERT INTO author (name, age, is_alive)
VALUES ('Джоан Роулинг', 50, true);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторА', 10, false);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторБ', 20, true);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторВ', 30, false);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторГ', 40, true);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторД', 50, false);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторЕ', 60, true);
INSERT INTO author (name, age, is_alive)
VALUES ('АвторЁ', 70, false);