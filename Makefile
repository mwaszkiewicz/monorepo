
c4:
	docker run -it --rm -v $(PWD):/usr/local/structurizr -e STRUCTURIZR_WORKSPACE_PATH=documentation/system-landscape -p 8080:8080 structurizr/lite
