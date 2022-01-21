package book

import (
	"context"
)

type Repository interface {
	FindAll(ctx context.Context) (u []Book, err error)
}
