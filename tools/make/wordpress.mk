CLEAN_FOLDERS := public
WP_DELETE_PLUGINS := akismet hello
WP_DELETE_THEMES := twentynineteen twentyseventeen
SYNC_TARGETS += wp-sync

PHONY += fresh
fresh: clean up build sync prepare ## Create fresh instance

PHONY += prepare
prepare:
	$(call step,Remove obsolete files)
	@rm -f $(WEBROOT)/*.{txt,html} $(WEBROOT)/composer.json && printf "Files deleted.\n"
	$(call step,Set uploads folder)
	@mkdir -p uploads
	@ln -fns ../../uploads public/wp-content/uploads
	$(call step,Copy configuration)
	@cp -v conf/wp-config.php $(WEBROOT)/wp-config.php
	$(call step,Delete inactivated plugins)
	$(call wp,plugin delete $(WP_DELETE_PLUGINS))
	$(call step,Delete inactivated themes)
	$(call wp,theme delete $(WP_DELETE_THEMES))

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

PHONY += wp-sync
wp-sync: ## Sync database & files
	$(call step,Sync database from WP_SYNC_SOURCE...)
	@${DOCKER_COMPOSE_EXEC} php ${CLI_SHELL} -c "pwd"
	$(call step,Sync files from WP_SYNC_SOURCE...)

define wp
	@${DOCKER_COMPOSE_EXEC} php ${CLI_SHELL} -c "wp --color --path=$(DOCKER_PROJECT_ROOT)/$(WEBROOT) $(1)"
endef
