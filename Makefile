REPO = butopea/adminer
ADMINER_VERSION=4.17.1
ADMINER_FLAVOUR=-en
ADMINER_CHECKSUM=8cef8dcac2bb4598fb821859deb61c9b6889b4bdad00498a38d113954334bbb3
TAG=$(ADMINER_VERSION)$(ADMINER_FLAVOUR)

all: build publish latest

build:
	docker build \
		--build-arg ADMINER_VERSION=$(ADMINER_VERSION) \
		--build-arg ADMINER_CHECKSUM=$(ADMINER_CHECKSUM) \
		--build-arg ADMINER_FLAVOUR=$(ADMINER_FLAVOUR) \
		-t $(REPO):$(TAG) \
		src

publish:
	docker push $(REPO):$(TAG)

latest:
	docker tag $(REPO):$(TAG) $(REPO):latest
	docker push $(REPO):latest

.PHONY: all build publish
