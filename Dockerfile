FROM drtools/scientific

RUN conda install -y lz4 psutil tornado && \
    conda install -y -c conda-forge \
      pandas \
      dask \
      distributed \
      fastparquet \
      s3fs \
      python-blosc \
      gcsfs && \
    conda clean -tipsy && \
    rm -rf /opt/conda/pkgs/*

ARG SPARSITY_VERSION=0.14

RUN mkdir -p /home/drtools/.build/ && \
    cd /home/drtools/.build/ && \
    curl -L "https://github.com/datarevenue-berlin/sparsity/archive/v${SPARSITY_VERSION}.tar.gz" | tar xz && \
    pip install --no-cache-dir -e "sparsity-${SPARSITY_VERSION}"