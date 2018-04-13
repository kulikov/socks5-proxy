package main

import (
	"os"
	"log"
	"bufio"

	"github.com/armon/go-socks5"
)

func main() {
	cator := socks5.UserPassAuthenticator{Credentials: FileCredentials{os.Getenv("PASSWORD_FILE")}}

	conf := &socks5.Config{
		AuthMethods: []socks5.Authenticator{cator},
		Logger:      log.New(os.Stdout, "", log.LstdFlags),
	}

	server, err := socks5.New(conf)
	if err != nil {
		panic(err)
	}

	if err := server.ListenAndServe("tcp", "0.0.0.0:1080"); err != nil {
		panic(err)
	}
}

type FileCredentials struct {
	FilePath string
}

func (f FileCredentials) Valid(user, password string) bool {
	file, err := os.Open(f.FilePath)
	if err != nil {
		panic(err)
	}

	defer file.Close()

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		if user+":"+password == scanner.Text() {
			return true
		}
	}

	return false
}
