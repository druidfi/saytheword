PHONY += build-image
build-image: ## Build Docker image for Wordpress
	$(call step,Build Docker image for Wordpress)
	docker build --no-cache --force-rm . -t helfi/wordpress:latest
