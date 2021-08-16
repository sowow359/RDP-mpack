MPACK_NAME ?= $(shell cat mpack.json | jq -r '.name')
VERSION ?= $(shell cat mpack.json | jq -r '.version')
MPACK_FULL_NAME = $(MPACK_NAME)-$(VERSION)

build:
	rm -rf .build
	mkdir -p .build/$(MPACK_FULL_NAME)
	cp -r stacks .build/$(MPACK_FULL_NAME)
	cp mpack.json .build/$(MPACK_FULL_NAME)
	cd .build && tar -zcvf $(MPACK_FULL_NAME).tar.gz ./$(MPACK_FULL_NAME)
	rm -rf .build/$(MPACK_FULL_NAME)
