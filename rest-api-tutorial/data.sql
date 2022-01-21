DROP TABLE IF EXISTS author CASCADE;
DROP TABLE IF EXISTS book CASCADE;
DROP TABLE IF EXISTS book_authors CASCADE;

CREATE TABLE public.author
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL
);

CREATE TABLE public.book
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    age  INT
);

CREATE TABLE public.book_authors
(
    id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    book_id   UUID NOT NULL,
    author_id UUID NOT NULL,

    CONSTRAINT book_fk FOREIGN KEY (book_id) REFERENCES public.book (id),
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author (id),
    CONSTRAINT book_author_unique UNIQUE (book_id, author_id)
);

INSERT INTO author (id, name)
VALUES ('707f69e0-edac-4c3e-bb7f-918d3f190e19', 'Народ');
INSERT INTO author (id, name)
VALUES ('1ad0596d-e43d-4093-a7fe-a6c1074f6219', 'Джоан Роулинг');
INSERT INTO author (id, name)
VALUES ('62af3986-0963-465c-8a86-dd23ac240523', 'Джек Лондон');

INSERT INTO book (id, name, age)
VALUES ('e51083cf-ee8e-4ee1-adfe-fbcbd5c5574c', 'колобок', 1000);
INSERT INTO book (id, name, age)
VALUES ('dcb2f994-dc9d-4743-8d50-9ac253930768', 'гарри поттер', 22);
INSERT INTO book (id, name)
VALUES ('39b9c138-5e2b-481b-8827-af0001ed53e0', 'брилианты');


-- kolobok
INSERT INTO book_authors (book_id, author_id)
VALUES ('e51083cf-ee8e-4ee1-adfe-fbcbd5c5574c', '1ad0596d-e43d-4093-a7fe-a6c1074f6219');
INSERT INTO book_authors (book_id, author_id)
VALUES ('e51083cf-ee8e-4ee1-adfe-fbcbd5c5574c', '707f69e0-edac-4c3e-bb7f-918d3f190e19');

-- HP
INSERT INTO book_authors (book_id, author_id)
VALUES ('dcb2f994-dc9d-4743-8d50-9ac253930768', '707f69e0-edac-4c3e-bb7f-918d3f190e19');
INSERT INTO book_authors (book_id, author_id)
VALUES ('dcb2f994-dc9d-4743-8d50-9ac253930768', '62af3986-0963-465c-8a86-dd23ac240523');
INSERT INTO book_authors (book_id, author_id)
VALUES ('dcb2f994-dc9d-4743-8d50-9ac253930768', '1ad0596d-e43d-4093-a7fe-a6c1074f6219');



        DTO         DTO
LAYER_A --> LAYER_B --> LAYER_C

HANDLER (JSON-->DTO-->) SERVICE --> DAO -->DB-->DTO-->MODEL--> SERVICE




