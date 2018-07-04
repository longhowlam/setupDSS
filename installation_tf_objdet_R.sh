#### Script om volgende te installeren 
# python tensorflow / object detection api e installeren
# Rstudio server met tidyverse en sparklyr

### login if needed
ssh root@178.128.240.142

# maak een user ruser met pasword ruser123 en zet ook in sudo group
useradd -m ruser
passwd    ruser
ruser123
ruser123
gpasswd -a ruser sudo
su - ruser

#### Zorg voor een anaconda omgeving
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
sha256sum Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh

#### tensorflow en tf 
# following instructions at
# https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md

pip install tensorflow

## clone models into tensorflow
cd anaconda3/lib/python3.6/site-packages/tensorflow
git clone https://github.com/tensorflow/models.git

## install dependencies
sudo apt-get install protobuf-compiler python-pil python-lxml python-tk
sudo apt-get install make

sudo apt-get update
sudo apt-get install gcc
sudo apt-get install unzip

pip install --user msgpack
pip install --user Cython
pip install --user contextlib2
pip install --user jupyter
pip install --user matplotlib

git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
make
cp -r pycocotools /home/ruser/anaconda3/lib/python3.6/site-packages/tensorflow/models/research/


### need to upgrade protoc
curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/

cd /home/ruser/anaconda3/lib/python3.6/site-packages/tensorflow/models/research/

/usr/local/bin/protoc object_detection/protos/*.proto --python_out=.
#Add Libraries to PYTHONPATH
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

#test the object detection API
python object_detection/builders/model_builder_test.py

### start notebook on server
jupyter notebook --no-browser --port 8889

### start tunnel on local machine
ssh -N -f -L localhost:8888:localhost:8889 root@178.128.240.142
#############################################################################################################

##### rstudio en R

###### install R #####################################################################################
sudo sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list' 
## add keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
## install
sudo apt-get update 
sudo apt-get  install r-base 
Y

####### install RStudio ###############################################################################
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb
sudo gdebi --n rstudio-server-1.1.453-amd64.deb

### installeer dependencies om devtools te kunnen installeren
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev  libssl-dev

#### installeer veel gebruikte R packages
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('tidyverse', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('leaflet', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('visNetwork', repos='http://cran.rstudio.com/')\""

sudo su - -c "R -e \"install.packages('plotly', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('text2vec', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('arules', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('arulesViz', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sparklyr', repos='http://cran.rstudio.com/')\""

