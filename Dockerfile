FROM tensorflow/tensorflow:1.10.0-gpu-py3
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y python3.5-dev python3-pip vim git libgtk2.0-dev 

RUN python3.5 -m pip install pip --upgrade

RUN python3.5 -m pip install tensorflow-gpu==1.10.0 \
                             glob3 \
							 numpy==1.14.5 \
							 open3d-python \
							 parse==1.12.0 \
							 scikit-learn==0.20.3 \
							 tensorboard==1.10 \
							 tqdm==4.31.1

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------
RUN ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/* 
