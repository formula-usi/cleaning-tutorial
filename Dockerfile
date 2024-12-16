FROM tensorflow/tensorflow:2.3.1
 
WORKDIR /home
 
RUN apt-get update \
    && apt-get install -y wget --no-install-recommends g++ gcc ca-certificates\
    && apt-get install -y git \
    && apt-get install -y libgl1-mesa-glx

RUN git clone https://github.com/autorope/donkeycar.git \
    && cd donkeycar \
    && git checkout 2c4f3e4 

RUN pip install --upgrade pip \
    && cd donkeycar \
    && pip install opencv-python==4.5.3.56  \
    && pip install -e .[pc]

# Copy the folder mynewcar to the docker image
COPY mynewcar /home/mynewcar
