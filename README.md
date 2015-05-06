# docker-ipython-opencv
Dockerfile to run ipython/scipy server with the addition of OpenCV.

Based from the ipython/scipyserver docker image, this dockerfile adds the latest 
(from github source) OpenCV (currently 3.x) on top of the ipython/scipyserver stack.
###Base Docker Image
ipython/scipyserver
###Usage
#####(Assumes that docker has been installed.  If not, start [here](https://docs.docker.com/installation/#installation).)
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
After it is running, point your browser to https://localhost, login with the password provided in above step, and you can then start your first ipython notebook using the wonderful OpenCV module.  Here is some sample code to get you started:
```
    %matplotlib inline
    import cv2
    import numpy as np
    from matplotlib import pyplot as plt
    
    # create image
    height,width = 400, 200
    img = np.zeros((height,width,3), np.uint8)
    
    img[:,0:0.5*width] = (255,0,0) 
    img[:,0.5*width:width] = (0,255,0)
    
    plt.imshow(img)
    plt.title('New Image: Half Red, Half Green'), plt.xticks([]), plt.yticks([])
```
