FROM debian:stable-slim
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl python3 pip git
RUN apt install -y gpg wget lsb-release
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update && apt install terraform
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN curl -fsSL https://code-server.dev/install.sh | sh
CMD ["code-server","--user-data-dir", "/config","--auth", "none","--bind-addr","0.0.0.0:8080","/data"]