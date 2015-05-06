# docker-ipython-opencv
Dockerfile to run ipython/scipy server with the addition of OpenCV.

Based from the ipython/scipyserver docker image, this dockerfile adds the latest 
(from github source) OpenCV (currently 3.x) on top of the ipython/scipyserver stack.
###Base Docker Image
ipython/scipyserver
###Usage
Pull it:
```
    docker pull trafferty/docker-ipython-opencv
```
Build it:
```
    docker build -t trafferty/docker-ipython-opencv
```
Run it:
```
    docker run --name cv_notebook -d -p 443:8888 -v $(pwd):/notebooks -e "PASSWORD=MY_PASSWORD"  trafferty/docker-ipython-opencv
```
