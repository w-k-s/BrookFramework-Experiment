build:
	mkdir -p build/units
	fpc cgi1.lpr -Fucore -Fubrokers -Fiincludes -FEbuild -FUbuild/units

run: build
	docker build -t hello-brooke .
	docker run -d -p 8080:80 hello-brooke