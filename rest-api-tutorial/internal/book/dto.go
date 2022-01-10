package book

type CreateBookDTO struct {
	Name     string `json:"name"`
	AuthorID int    `json:"author_id"`
}
