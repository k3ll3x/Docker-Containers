# Use the latest Arch Linux base image
FROM archlinux:latest

ARG username="atrahasis"
ARG userhome="/home/atrahasis"

ENV HOME ${userhome}

RUN pacman-db-upgrade
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm \
	docker \
	python \
	python-pip \
	python-pipx \
	sudo \
	nano \
	curl \
	wget \
	tar \
	unzip \
	fish

RUN chsh -s /usr/bin/fish

# User
RUN mkdir -p ${userhome}
RUN groupadd -r ${username}
RUN useradd -rm -G wheel -G docker -d ${userhome} -s /usr/bin/fish -g ${username} -u 1000 ${username}
RUN chown -R ${username}:${username} ${userhome}
RUN echo ${username}:${username} | chpasswd

# Allow members of the wheel group to use sudo
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#RUN mv /usr/bin/docker /usr/bin/_ogdocker
RUN printf "#!/bin/bash\nsudo docker \"\$@\"\n" >> /usr/bin/dockerx
RUN chmod +x /usr/bin/dockerx

USER ${username}
ENV fish_greeting=""
WORKDIR ${userhome}

RUN mkdir -p ${userhome}/.config/fish
RUN touch ${userhome}/.config/fish/config.fish

#codex
RUN wget https://github.com/openai/codex/releases/download/rust-v0.57.0/codex-x86_64-unknown-linux-musl.tar.gz
RUN tar xvf codex*
RUN rm *.tar.gz
RUN mv codex* codex
RUN mkdir -p .codex
RUN mkdir -p bin
RUN mv codex bin
ENV PATH="$PATH:${userhome}/bin"

#mcp-client-for-ollama 
RUN pipx ensurepath
RUN pipx install ollmcp mcp uv
#RUN ollmcp --install-completion
ENV PATH="$PATH:${userhome}/.local/bin"

ENTRYPOINT ["/usr/bin/fish", "-c"]
