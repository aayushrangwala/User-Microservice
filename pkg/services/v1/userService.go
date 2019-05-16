package v1

import (
	"encoding/json"
	"net/http"

	"github.com/aayushrangwala/User-Microservice/util"

	"github.com/gorilla/mux"
)

// GetUserProfile return the profile of the user
func GetUserProfile(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	userName := vars["user"]
	userDet := &util.UserDetails{
		Name:  userName,
		Dob:   "01/01/2000",
		Age:   19,
		Email: "ex@ex.com",
		Phone: "9999999999",
	}
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(userDet); err != nil {
		panic(err)
	}
}

// GetMicroserviceName test
func GetMicroserviceName(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode("User Microservice")
}