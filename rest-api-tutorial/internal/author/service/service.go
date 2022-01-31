package service

import (
	"context"
	"fmt"
	"restapi-lesson/internal/author/model"
	"restapi-lesson/internal/author/storage"
	"restapi-lesson/pkg/api/sort"
	"restapi-lesson/pkg/logging"
)

type Service struct {
	repository storage.Repository
	logger     *logging.Logger
}

func NewService(repository storage.Repository, logger *logging.Logger) *Service {
	return &Service{repository: repository, logger: logger}
}

func (s *Service) GetAll(ctx context.Context, sortOptions sort.Options) ([]model.Author, error) {
	options := storage.NewSortOptions(sortOptions.Field, sortOptions.Order)
	all, err := s.repository.FindAll(ctx, options)
	if err != nil {
		return nil, fmt.Errorf("failed to get all authors due to error: %v", err)
	}
	return all, nil
}
