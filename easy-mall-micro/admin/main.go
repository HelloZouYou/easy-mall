package main

import (
	"net/http"

	"github.com/micro/go-micro/util/log"

	"github.com/micro/go-micro/web"
)

func main() {
	// create new web service
	service := web.NewService(
		web.Name("easymall.web.admin"),
		web.Version("latest"),
		web.Address(":80"),
	)

	// initialise service
	if err := service.Init(); err != nil {
		log.Fatal(err)
	}

	// register html handler
	service.Handle("/", http.FileServer(http.Dir("/html")))

	// run service
	if err := service.Run(); err != nil {
		log.Fatal(err)
	}
}
