IMG:=i3-gaps-build

build:
	docker build -t $(IMG) .
	docker run --rm -v $(shell pwd):/out $(IMG) sh -c "cp /i3-wm_*_amd64.deb /out"

.PHONY: build
