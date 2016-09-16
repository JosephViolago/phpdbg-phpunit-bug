.PHONY: default
default: build

.PHONY: all
all: build

.PHONY: build
build: test

.PHONY: build-dependencies
build-dependencies:
	composer install --no-interaction --prefer-dist

.PHONY: clean-dependencies
clean-dependencies:
	rm -rf composer.lock vendor

.PHONY: reset-dependencies
reset-dependencies:
	git checkout composer.lock
	rm -rf vendor
	make build-dependencies

.PHONY: test
test: build-dependencies
	vendor/bin/phpunit || true
	@echo "\n\n"
	@printf '%.0s-' {1..80}; echo
	@printf '%.0s-' {1..80}; echo
	@echo "\n\n"
	phpdbg -qrr vendor/bin/phpunit || true

53_versions := $(shell echo "5.3."{0..5})
54_versions := $(shell echo "5.4."{0..8})
55_versions := $(shell echo "5.5."{0..4})

.PHONY: ${53_versions}
${53_versions}: clean-dependencies
	composer require "phpunit/phpunit:$@"
	vendor/bin/phpunit --version
	make test

.PHONY: ${54_versions}
${54_versions}: clean-dependencies
	composer require "phpunit/phpunit:$@"
	vendor/bin/phpunit --version
	make test

.PHONY: ${55_versions}
${55_versions}: clean-dependencies
	composer require "phpunit/phpunit:$@"
	vendor/bin/phpunit --version
	make test

.PHONY: test-phpunit-53
test-phpunit-53: $(53_versions) reset-dependencies

.PHONY: test-phpunit-54
test-phpunit-54: $(54_versions) reset-dependencies

.PHONY: test-phpunit-55
test-phpunit-55: $(55_versions) reset-dependencies
