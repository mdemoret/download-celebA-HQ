FROM continuumio/miniconda3

RUN apt-get update \
    && apt-get install -y -q p7zip-full \
    && rm -rf /var/lib/apt/lists/*

RUN conda install jpeg=8d tqdm requests pillow==3.1.1 urllib3 numpy cryptography scipy

RUN pip install opencv-python==3.4.0.12 cryptography==2.1.4

COPY . /workspace

WORKDIR /workspace

CMD python ./download_celebA.py /data && \
    python ./download_celebA_HQ.py /data && \
    python ./make_HQ_images.py /data
