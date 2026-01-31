FROM debian:latest

SHELL ["/bin/bash", "-c"] 

RUN apt update
RUN apt install -y python3 python3-pip cmake git

# Get the emsdk repo
RUN git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
WORKDIR emsdk

# Fetch the latest version of the emsdk (not needed the first time you clone)
#RUN git pull

# Download and install the latest SDK tools.
RUN ./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
RUN ./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
RUN source ./emsdk_env.sh

#RUN bash ./emsdk_env.sh

WORKDIR /src

ENTRYPOINT ["/bin/bash"]
