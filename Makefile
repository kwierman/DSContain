mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

build:
	nvidia-docker build -t kwierman/dlx:latest .

run:
	nvidia-docker run --name dlx -d --mount src=$(current_dir),target=/workspace,type=bind -p 8888:8888 kwierman/dlx:latest
	sleep 1
	nvidia-docker logs dlx

clean:
	nvidia-docker stop dlx
	nvidia-docker rm dlx
