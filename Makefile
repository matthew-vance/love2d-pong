project_name := love2d-pong
love := /Applications/love.app/Contents/MacOS/love

run: build launch

launch:
	${love} ./build/${project_name}.love

lint:
	luacheck .

clean:
	@echo "Deleting \"build/${project_name}.love\" ..."
	@rm -rf build/${project_name}.love
	@echo "Done!"

build: lint clean
	@echo "Building ${project_name}.love ..."
	cd src && zip -9 -r ../build/${project_name}.love .
	@echo "Done!"
	@echo "Run \"make start\" to play the game!"

.PHONY: start lint clean build run
