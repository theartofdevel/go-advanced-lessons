package author

import (
	"encoding/json"
	"github.com/julienschmidt/httprouter"
	"net/http"
	"restapi-lesson/internal/apperror"
	service2 "restapi-lesson/internal/author/service"
	"restapi-lesson/internal/handlers"
	"restapi-lesson/pkg/api/sort"
	"restapi-lesson/pkg/logging"
)

const (
	authorsURL = "/authors"
	authorURL  = "/authors/:uuid"
)

type handler struct {
	logger  *logging.Logger
	service *service2.Service
}

func NewHandler(service *service2.Service, logger *logging.Logger) handlers.Handler {
	return &handler{
		service: service,
		logger:  logger,
	}
}

func (h *handler) Register(router *httprouter.Router) {
	router.HandlerFunc(http.MethodGet, authorsURL, sort.Middleware(apperror.Middleware(h.GetList), "created_at", sort.ASC))
}

func (h *handler) GetList(w http.ResponseWriter, r *http.Request) error {
	var sortOptions sort.Options
	if options, ok := r.Context().Value(sort.OptionsContextKey).(sort.Options); ok {
		sortOptions = options
	}

	all, err := h.service.GetAll(r.Context(), sortOptions)
	if err != nil {
		w.WriteHeader(400)
		return err
	}

	allBytes, err := json.Marshal(all)
	if err != nil {
		return err
	}

	w.WriteHeader(http.StatusOK)
	w.Write(allBytes)

	return nil
}
