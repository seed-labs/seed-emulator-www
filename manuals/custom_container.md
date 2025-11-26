---
 layout: default
 title:  Add Custom Containers
---


Sometimes, we may already have an existing container image, and we want some of the containers in the emulator to use this image. There are three ways to do this. 


## Table of Contents 
{: .no_toc}

* will be replaced by ToC 
{:toc}

---


## Method 1: add custom containers during the building time

In this method, we add existing containers when building the emulator. 
We have implemented this feature in the `Docker` compiler class. The basic idea
is to tell the compiler that we want to attach an existing container to 
a network inside the emulator. The compiler will then generate the corresponding
entry inside the `docker-compose.yml` file.

See [this example]({{ site.example-url }}/basic/A11_add_containers_new/method_1/) for details.


## Method 2: add custom containers during the runtime 

In this method, we add the existing containers after we have built the emulator.
Using this method, we first start the emulator, and then start the additional containers
from the existing images. We attach these containers to the networks created by the emulator.
This way, the new containers becomes part of the emultion.

See [this example]({{ site.example-url }}/basic/A10_add_containers/) for details.



## Method 3: Use custom docker images as the base

In the emulator, each node uses a default base image provided by the emulator. If users want to use a custom docker image, they can follow the instructions below:  

 - First, we create a `DockerImage` object, where the container files 
   for this docker image are provided in the `my_image` folder. 
 - Then, we use the `setImageOverride` API to set this image for the specified node. The Dockerfile
   of this node will use this image as its base image. 
 - After generating the final output, we need to copy the docker image folder 
   to the output folder. 


```python
# Create a new node (we will use the pre-built docker image for this node)
newhost = emu.getLayer('Base').getAutonomousSystem(150).createHost('new_host')
newhost.joinNetwork('net0')

# Create a Docker object
docker = Docker(platform=Platform.AMD64)

# Create an DockerImage object 
image  = DockerImage(name='my_image', dirName='./my_image', local=True, software=[])
docker.addImage(image)

# Use the custom image as the base image for the specified node
docker.setImageOverride(newhost, 'my_image')

# Generate the docker files
emu.render()
emu.compile(docker, 'output/', override = True)

# Need to manually copy the image folder to the output folder
os.system('cp -r my_image/ ' + 'output/')
```

The example shown above uses a local image. We can also use a image from 
an image from the Docker Hub. Here is an example. 

```python
imageName = 'handsonsecurity/seedemu-ethereum'
image  = DockerImage(name=imageName, local=False, software=[])
docker.addImage(image)
docker.setImageOverride(newhost, imageName)
```