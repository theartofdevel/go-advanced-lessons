CREATE TABLE public.author (
                               id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                               name VARCHAR(100) NOT NULL
);

CREATE TABLE public.book (
                             id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             name VARCHAR(100) NOT NULL,
                             author_id UUID NOT NULL,
                             CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author(id)
);

INSERT INTO author (name) VALUES ('Народ'); -- 707f69e0-edac-4c3e-bb7f-918d3f190e19
INSERT INTO author (name) VALUES ('Джоан Роулинг'); -- 1ad0596d-e43d-4093-a7fe-a6c1074f6219
INSERT INTO author (name) VALUES ('Джек Лондон'); -- 62af3986-0963-465c-8a86-dd23ac240523

INSERT INTO book (name, author_id) VALUES ('колобок', '707f69e0-edac-4c3e-bb7f-918d3f190e19');
INSERT INTO book (name, author_id) VALUES ('гарри поттер', '1ad0596d-e43d-4093-a7fe-a6c1074f6219');
INSERT INTO book (name, author_id) VALUES ('брилианты', '62af3986-0963-465c-8a86-dd23ac240523');