---
 layout: default
 title:  Docker Images
---


## Table of Contents 
{: .no_toc}

* will be replaced by ToC 
{:toc}

---

<a id="platform"></a>
## Generate docker images for different platforms

Most of the docker images were built using the multi-arch build approach,
i.e., the same docker image name is used for multiple platforms. 
However, we have not been able to build our Ethereum docker image
using the multi-arch approach (we have not got time to figure out why),
so for this image, the names for different platforms are different. 
Users still have to specify the platform using the `platform` 
argument when creating the `Docker` object. See the following 
example

```python
# For AMD64 machines (default)
docker = Docker(platform=Platform.AMD64)

# For Apple Silicon machines (M1/M2 chips)
docker = Docker(platform=Platform.ARM64)
```

