FROM debian:latest

ARG username="devu"
ARG userhome="/home/devu"
ARG srcpath="/src"

ENV HOME ${userhome}

RUN apt update
RUN apt upgrade -y
RUN apt update

# Python3 & build essentials
RUN apt install -y \
	python3 python3-pip cmake \
	build-essential libpng-dev libglu1-mesa-dev libx11-dev libpthread-stubs0-dev \
	autoconf automake pkg-config

# OpenGL
RUN apt install -y \
	libglfw3-dev \
	libglew-dev \
	libgles2-mesa-dev \
	freeglut3-dev

#Misc
RUN apt install -y \
	git nano wget \
	openssh-server \
	sudo \
	tmux \
	firefox-esr \
	fish \
	xonsh \
	libreoffice

#Haskell
RUN apt install -y \
	ghc cabal-install haskell-stack

RUN pip install numpy pandas openpyxl matplotlib
RUN pip install tensorflow keras

# Universal Ctags
RUN	git clone https://github.com/universal-ctags/ctags.git; \
	cd ctags; \
	./autogen.sh; \
	./configure; \
	make; \
	make install

# Get emscripten source
RUN git clone https://github.com/emscripten-core/emscripten.git

# Get the emsdk repo
RUN git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
WORKDIR /emsdk

# Fetch the latest version of the emsdk (not needed the first time you clone)
#RUN git pull

# Download and install the latest SDK tools.
RUN ./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
RUN ./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
# RUN bash ./emsdk_env.sh

# Go-lang
WORKDIR /usr/local/
RUN wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
RUN tar -xzf go1.19.1.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# User
RUN mkdir -p ${userhome}
RUN mkdir -p ${userhome}${srcpath}
RUN groupadd -r ${username}
RUN useradd -rm -d ${userhome} -s /usr/bin/fish -g ${username} -u 1000 ${username}
RUN adduser ${username} sudo
RUN chown -R ${username}:${username} ${userhome}
RUN chown -R ${username}:${username} ${userhome}${srcpath}
RUN echo ${username}:${username} | chpasswd

RUN service ssh start
CMD ["/usr/sbin/sshd","-D"]
EXPOSE 22

USER ${username}
ENV fish_greeting="Lasciate ogni speranza, voi ch'entrate"
WORKDIR ${userhome}${srcpath}

CMD ["/bin/bash", "-c", "source", "/emsdk/emsdk_env.sh"]
ENTRYPOINT ["/usr/bin/fish", "-c"]
