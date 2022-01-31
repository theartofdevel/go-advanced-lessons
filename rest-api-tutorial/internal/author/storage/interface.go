package storage

import (
	"context"
	"restapi-lesson/internal/author/model"
)

type Repository interface {
	Create(ctx context.Context, author *model.Author) error
	FindAll(ctx context.Context, sortOptions SortOptions) (u []model.Author, err error)
	FindOne(ctx context.Context, id string) (model.Author, error)
	Update(ctx context.Context, user model.Author) error
	Delete(ctx context.Context, id string) error
}

type SortOptions interface {
	GetOrderBy() string
}
