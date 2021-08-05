NAME ?= $(shell cat mpack.json | jq -r '.name')
VERSION ?= $(shell cat mpack.json | jq -r '.version')
MPACK_NAME = "$(NAME)-$(VERSION)"

build:
	rm -rf .build
	mkdir -p .build/$(MPACK_NAME)
	cp -r stacks .build/$(MPACK_NAME)
	cp mpack.json .build/$(MPACK_NAME)
	cd .build && tar -zcvf $(MPACK_NAME).tar.gz ./$(MPACK_NAME)
	rm -rf .build/$(MPACK_NAME)
