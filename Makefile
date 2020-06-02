REPO = ${HOME}/repositories/2u/uci/uci-irv-cyber-pt-03-2020-u-c/Week-12-Cloud-Security/Resources/terraform/


### AZURE TERRAFORM DEPLOYMENT ###
.PHONY: prebuild
prebuild:
	source bin/config.sh && bin/prebuild.sh

.PHONY: build
build:
	bin/build.sh

.PHONY: destroy
destroy: 
	bin/destroy.sh
