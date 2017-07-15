# jupyter-opencv
Jupyter/scipy server with OpenCV ver 3.x.  Based on [Jupyter Project](http://jupyter.org/index.html)

Based off of [jupyter/scipy-notebook](https://hub.docker.com/r/jupyter/scipy-notebook/) docker image, this dockerfile adds the latest (from github source) OpenCV (currently 3.x) on top of the jupyter/scipy-notebook stack.
### Base Docker Image
jupyter/scipy-notebook
### Usage
##### (Assumes that docker has been installed.  If not, start [here](https://docs.docker.com/installation/#installation).)
Pull it:
```
    docker pull trafferty/docker-ipython-opencv
```
Run it:
```
    docker run --name cv_notebook -d -p 443:8888 -v $(pwd):/notebooks -e "PASSWORD=MY_PASSWORD" trafferty/docker-ipython-opencv
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
