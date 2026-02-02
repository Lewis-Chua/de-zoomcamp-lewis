Docker Run
1. docker run hello-world
2. docker run -it ubuntu
3. docker run -it python:3.13.11 
4. docker run -it --entrypoint=bash python:3.13.11
5. docker ps -aq
6. docker rm `docker ps -aq`
7. docker ps -a
8. mkdir test
9. touch file1.txt file2.txt file3.txt
10. echo "Hello from host" > file1.txt
11. docker run -it --entrypoint=bash -v $(pwd)/test:/app/test python:3.13.11-slim
12.  docker run -it --entrypoint-bash --rm test:
pandas  