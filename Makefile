include cmds.mk
bins := $(foreach tgt,$(cmds),$(shell bazel cquery --output=files $(tgt) 2>/dev/null))

.PHONY: default
default:
	bazel build //...

.PHONY: deps
deps:
	bazel run //:gazelle -- fix

.PHONY: gover
gover:
	@$$(bazel info output_base)/external/go_sdk/bin/go version

.PHONY: showcmds
showcmds:
	@echo ${cmds}

.PHONY: showbins
showbins:
	@echo ${bins}

.PHONY: clean
clean:
	rm cmds.mk
	find . -name '*~' -exec rm -f {} \;

.PHONY: reallyclean
reallyclean: clean
	bazel clean

.PHONY: pristine
pristine: clean
	bazel clean --expunge
	rm -f MODULE.bazel.lock

cmds.mk: Makefile MODULE.bazel cmd/*/BUILD.bazel
	@echo -n 'cmds := ' > $@
	@bazel query 'kind("go_binary", //...)' 2>/dev/null | xargs >> $@
