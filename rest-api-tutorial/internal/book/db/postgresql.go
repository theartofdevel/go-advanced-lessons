package db

import (
	"context"
	"restapi-lesson/internal/book"
	"restapi-lesson/pkg/client/postgresql"
	"restapi-lesson/pkg/logging"
)

type repository struct {
	client postgresql.Client
	logger *logging.Logger
}

func NewRepository(client postgresql.Client, logger *logging.Logger) book.Repository {
	return &repository{
		client: client,
		logger: logger,
	}
}

func (r *repository) FindAll(ctx context.Context) (u []book.Book, err error) {
	q := `
		SELECT id, name, age FROM public.book;
	`

	rows, err := r.client.Query(ctx, q)
	if err != nil {
		return nil, err
	}

	books := make([]book.Book, 0)

	for rows.Next() {
		var bk Book

		err = rows.Scan(&bk.ID, &bk.Name, &bk.Age)
		if err != nil {
			return nil, err
		}

		books = append(books, bk.ToDomain())
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return books, nil
}
