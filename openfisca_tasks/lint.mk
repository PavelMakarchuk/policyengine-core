## Lint the codebase.
lint: check-syntax-errors check-style check-types

## Compile python files to check for syntax errors.
check-syntax-errors: .
	@$(call help,$@:)
	@python -m compileall -q $?

## Run linters to check for syntax and style errors.
check-style: $(shell git ls-files "*.py")
	@$(call help,$@:)
	@flake8 $?

## Run static type checkers for type errors.
check-types: openfisca_core openfisca_web_api
	@$(call help,$@:)
	@mypy $?

## Run code formatters to correct style errors.
format-style: $(shell git ls-files "*.py")
	@$(call help,$@:)
	@autopep8 $?
