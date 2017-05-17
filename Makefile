.PHONY=all

build_image=coturn

all: build

build:
	docker build -f Dockerfile.build -t ${build_image} .
