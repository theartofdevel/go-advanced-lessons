package db

import (
	"database/sql"
	"restapi-lesson/internal/author"
	"restapi-lesson/internal/book"
)

type Book struct {
	ID      string          `json:"id"`
	Name    string          `json:"name"`
	Age     sql.NullInt32   `json:"age"`
	Authors []author.Author `json:"authors"`
}

func (m *Book) ToDomain() book.Book {
	b := book.Book{
		ID:   m.ID,
		Name: m.Name,
	}
	if m.Age.Valid {
		b.Age = int(m.Age.Int32)
	}

	return b
}
