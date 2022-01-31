package book

import (
	"restapi-lesson/internal/author/model"
)

type Book struct {
	ID      string         `json:"id"`
	Name    string         `json:"name"`
	Age     int            `json:"age"`
	Authors []model.Author `json:"authors"`
}
