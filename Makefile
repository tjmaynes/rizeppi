install_dependencies:
	$(call install_dotnet_tool_if_not_exists,dotnet-format)
	cd src && dotnet restore

format:
	cd src && dotnet format \
	--fix-style error \
	--fix-analyzers error \
	--fix-whitespace

unit_and_integration_tests:
	cd src && dotnet test

e2e:
	./scripts/e2e.sh

test: unit_and_integration_tests e2e

build:
	cd src && dotnet build

start:
	cd src/Server && dotnet run

ship_it: install_dependencies format test build
	@echo "Ready to ship."

define install_dotnet_tool_if_not_exists
dotnet tool -g ${1} >/dev/null 2>&1 || true
endef