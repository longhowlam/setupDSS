FROM rocker/rstudio-stable:3.4.3

##### Pick up some dependencies ###################################################
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        ca-certificates \
        wget \
        git \
        vim \
        cmake \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


##### Python stuff ###################################################################


RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
    ipykernel \
    jupyter \
    matplotlib \
    numpy \
    scipy \
    pandas \
    scikit-learn \
    && \
    python -m ipykernel.kernelspec

RUN apt-get update && apt-get -y install  python-virtualenv

###### Install Java for h2o ###########################################################
RUN  apt-get update &&  apt-get -y install default-jdk

###### Additional R packages    ###########################################################
RUN R -e "install.packages('keras', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('h2o', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse', repos='http://cran.rstudio.com/')"


CMD ["/init"]

EXPOSE 8787 8888 54321
