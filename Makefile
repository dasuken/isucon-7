GOPATH := ${PWD}
export GOPATH

dev-local:
	ISUBATA_DB_HOST=35.200.125.210 ISUBATA_DB_PASSWORD=isucon ISUBATA_DB_USER=isucon go run ./src/isubata/app.go

build:
	go build -v isubata

vet:
	go vet ./src/isubata/...
