REDIS_VERSION=2.8.3
REDIS_SOURCE_DIR=redis-$(REDIS_VERSION)

all: build

build: $(REDIS_SOURCE_DIR)
	cd $(REDIS_SOURCE_DIR) && make

$(REDIS_SOURCE_DIR):
	curl -sSL https://github.com/antirez/redis/archive/$(REDIS_VERSION).tar.gz | tar zx

install:
	cd $(REDIS_SOURCE_DIR) && make install

.PHONY: install build all
