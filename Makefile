REDIS_VERSION=2.8.3
REDIS_SOURCE_DIR=redis-$(REDIS_VERSION)
REDIS_CONFIG=/etc/redis/redis.conf
REDIS_SRC_CONFIG=$(REDIS_SOURCE_DIR)/redis.conf

BATS_BASE_DIR=/usr/libexec/

all: build test-bats

build: $(REDIS_SOURCE_DIR) $(redis.conf)
	cd $(REDIS_SOURCE_DIR) && make

redis.conf:
	cp $(REDIS_SRC_CONFIG) redis.conf

$(REDIS_SOURCE_DIR):
	curl -sSL https://github.com/antirez/redis/archive/$(REDIS_VERSION).tar.gz | tar zx

install:
	cd $(REDIS_SOURCE_DIR) && make install
	mkdir -p /etc/redis
	cp $(REDIS_SRC_CONFIG) $(REDIS_CONFIG)
	# copy bats tests to libexec
	mkdir -p $(BATS_BASE_DIR)/redis/
	cp bats/redis.bats $(BATS_BASE_DIR)/redis/

install-runit:
	mkdir -p /etc/sv/redis
	cp -R sv/* /etc/sv/redis
	mkdir -p $(BATS_BASE_DIR)/redis-runit/
	cp bats/redis-runit.bats $(BATS_BASE_DIR)/redis-runit/

clean:
	rm -rf $(REDIS_SOURCE_DIR)

.PHONY: install build all redis.conf test
