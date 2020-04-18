PHONY += fresh
fresh: up build ## Create fresh instance

PHONY += wp-cache-flush
wp-cache-flush: ## Flush cache
	$(call step,Flush cache)
	$(call wp,cache flush)

PHONY += wp-help
wp-help: ## Show wp-cli help
	$(call wp,)

PHONY += wp-plugins
wp-plugins: ## List plugins
	$(call step,List plugins)
	$(call wp,plugin list)

define wp
	@${DOCKER_COMPOSE_EXEC} php ${CLI_SHELL} -c "wp --color --path=$(DOCKER_PROJECT_ROOT)/$(WEBROOT) $(1)"
endef
