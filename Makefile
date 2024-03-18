.PHONY: build-image push-image

# Build the image for the Docker
build-image: Dockerfile-sid
	docker build --file $< --no-cache -t registry.lrde.epita.fr/tc-sid .

# Run the image. Warning, all modifications will be removed
# at exit.
run-image:
	docker run -it registry.lrde.epita.fr/tc-sid
# Alternatively, you can use run-image-with-local to create an image with a
# local access at $TC_LOCAL directory.
# Again, all modifications will be removed at exit.
run-image-with-local:
	docker run -it -v "${TC_LOCAL}":/opt/tiger/tc registry.lrde.epita.fr/tc-sid

# Assume you renamed the container using:
#       ` docker rename SOMENAME tc-private`
# This is globally the only command you have to use once your docker
# has been built.
start:
	docker start tc-private
	docker attach tc-private
