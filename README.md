Based on Coder code-server with Python3, PIP, Azure CLI and Terraform

```docker
docker run -d -p 8080:8080 -v [data folder]:/data -v [config folder]:/config --name vscode-server peanutsguy/code-server:latest
```