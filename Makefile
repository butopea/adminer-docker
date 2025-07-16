REPO = butopea/adminer
ADMINER_VERSION=5.3.0
ADMINER_FLAVOUR=-en
ADMINER_CHECKSUM=51908245481dd69c8d8e38acd379e9917e10b80db842f8cf3022192b93232897
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
