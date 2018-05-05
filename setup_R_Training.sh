## Setup R training op een DO machientje

# login eerste
ssh root@128.199.58.136

# maak een user ruser met pasword ruser123
useradd -m ruser
passwd    ruser
ruser123

###### install R #####################################################################################
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
## add keys
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
## install
sudo apt-get update
sudo apt-get -y install r-base

####### install RStudio ###############################################################################
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.447-amd64.deb
sudo --n gdebi rstudio-server-1.1.447-amd64.deb

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

sudo su - -c "R -e \"devtools::install_github('hadley/colformat')\""
sudo su - -c "R -e \"devtools::install_github('ropenscilabs/skimr')\""
sudo su - -c "R -e \"devtools::install_github('jeromefroe/circlepackeR')\""

sudo su - -c "R -e \"install.packages('pryr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('anytime', repos='http://cran.rstudio.com/')\""

sudo apt-get install libgeos-dev
sudo apt-get install libproj-dev
sudo apt-get install libgdal1-dev

#library(RColorBrewer)
#library(colorRamps)
#library(rgeos)
#library(raster)
#library(sp)
#library(maptools)
#library(rgdal)


sudo su - -c "R -e \"install.packages('data.tree', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('treemap', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sunburstR', repos='http://cran.rstudio.com/')\""



#### java, is nodig voor h2o
sudo apt-get update
sudo apt-get install default-jdk

sudo su - -c "R -e \"install.packages('xgboost', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rpart', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('glmnet', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ranger', repos='http://cran.rstudio.com/')\""

sudo su - -c "R -e \"install.packages('rattle', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggfortify', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rsample', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('pROC', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ROCR', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('titanic', repos='http://cran.rstudio.com/')\""



sudo su - -c "R -e \"install.packages('h2o', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sparklyr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('keras', repos='http://cran.rstudio.com/')\""

