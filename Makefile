install_dependencies:
	./scripts/$@.sh

format:
	cd src && dotnet format \
	--fix-style error \
	--fix-analyzers error \
	--fix-whitespace

unit_and_integration_tests:
	cd src && dotnet test

e2e:
	./scripts/$@.sh

performance:
	./scripts/$@.sh

test: unit_and_integration_tests e2e

build:
	cd src && dotnet build

start:
	cd src/Server && dotnet run

ship_it: install_dependencies format test build
	@echo "Ready to ship."