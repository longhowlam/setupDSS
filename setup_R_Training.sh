## Setup R training op een DO machientje

# login eerste
ssh root@167.99.223.77

# maak een user ruser met pasword ruser123 en zet ook in sudo group
useradd -m ruser
passwd    ruser
ruser123
gpasswd -a ruser sudo

su ruser

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
wget https://download2.rstudio.org/rstudio-server-1.1.447-amd64.deb
sudo gdebi --n rstudio-server-1.1.447-amd64.deb

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

sudo apt-get -y install libgeos-dev
sudo apt-get -y install libproj-dev
sudo apt-get -y install libgdal1-dev

sudo su - -c "R -e \"install.packages('RColorBrewer', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('colorRamps', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rgeos', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('raster', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sp', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('maptools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rgdal', repos='http://cran.rstudio.com/')\""

sudo su - -c "R -e \"install.packages('data.tree', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('treemap', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sunburstR', repos='http://cran.rstudio.com/')\""


#### java, is nodig voor h2o
sudo apt-get update
sudo apt-get -y install default-jdk

sudo su - -c "R -e \"install.packages('xgboost', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rpart', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('glmnet', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ranger', repos='http://cran.rstudio.com/')\""

sudo apt-get -y install wajig 
sudo apt-get update
wajig install -y  libgtk2.0-dev

sudo su - -c "R -e \"install.packages('rattle', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggfortify', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rsample', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('pROC', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ROCR', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('titanic', repos='http://cran.rstudio.com/')\""

sudo su - -c "R -e \"install.packages('h2o', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sparklyr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('keras', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('mlr', repos='http://cran.rstudio.com/')\""
