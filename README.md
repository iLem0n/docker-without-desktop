# Run docker without desktop on mac

## Usage 
### Proxy setup (if necessary)
Create `.vagrant/secret.yaml` file within this folder the following content to authenticate against the proxy.

**Replace the values in brackets with your proxy values**

```yaml
# file: .vagrant/secret.yaml
proxy: "http://<proxy-user>:<proxy-pass>@<proxy-url>:<proxy-port>"
```

Run the following command to install all dependecies locally and bring up a virtual machine providing the docker-daemon via tcp port on `localhost:2375`.
This will also add an entry to `~/.bash_profile` to ensure `DOCKER_HOST` variable is properly set. 

```bash
./boostrap.sh
```
This will install: 
- vagrant
- ansible 
- docker (client) 
- some vagrant plugins 
- ansible docker role

## Verify 
This command shoul now work without docker-desktop installed
```bash
docker run hello-world
``` 

should print something like:
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```