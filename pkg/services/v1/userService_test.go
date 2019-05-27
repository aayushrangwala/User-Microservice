package v1

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestAuthenticateUsertoReturnHttpStatus(t *testing.T) {
	req, err := http.NewRequest("GET", "/user/profile", nil)
	if err != nil {
		t.Fatal(err)
	}

	// We create a ResponseRecorder (which satisfies http.ResponseWriter) to record the response.
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(GetUserProfile)

	// Our handlers satisfy http.Handler, so we can call their ServeHTTP method
	// directly and pass in our Request and ResponseRecorder.

	//Positive test
	req.Header.Set("Username", "test1")

	handler.ServeHTTP(rr, req)

	// Check the status code is what we expect.
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}

	// microservice name test
	req, err = http.NewRequest("GET", "/microservice/name", nil)

	rr = httptest.NewRecorder()
	handler = http.HandlerFunc(GetMicroserviceName)

	handler.ServeHTTP(rr, req)

	// Check the status code is what we expect.
	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
}
