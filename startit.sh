###### Install nginx #################################################################
sudo apt-get update
sudo apt-get -y install nginx


###### install R #########################################
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
## add keys
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
## install
sudo apt-get update
sudo apt-get -y install r-base

###### user was already created in cloud-config
cd /home/ruser/

###### install RStudio ##############################################################
sudo apt-get -y install libapparmor1 gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.383-amd64.deb
sudo gdebi --n /home/ruser/rstudio-server-1.1.383-amd64.deb


###### Install dataiku ##############################################################
cd /home/ruser/
wget https://downloads.dataiku.com/public/studio/4.1.0/dataiku-dss-4.1.0.tar.gz
tar xzf /home/ruser/dataiku-dss-4.1.0.tar.gz

### install dependencies first 
/home/ruser/dataiku-dss-4.1.0/scripts/install/install-deps.sh -yes
### needs to be installed not as root, and set access to a dir that was created
sudo chmod -R 777 /home/ruser/dataiku-dss-4.1.0/
sudo -u ruser /home/ruser/dataiku-dss-4.1.0/installer.sh -d dataikudir -p 11000

### Start DSS
sudo -u ruser /home/ruser/dataikudir/bin/dss start


###### Install Shiny server ###########################################################
### first install shiny r package 
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb
sudo gdebi --n shiny-server-1.5.5.872-amd64.deb


###### Install Java for h2o ###########################################################
sudo apt-get update
sudo apt-get install default-jdk

###### install additional R packages ##################################################
### installeer dependencies om devtools te kunnen installeren
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev

### packages
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('tidyverse', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('h2o', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('sparklyr', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('keras', repos='http://cran.rstudio.com/')\""

###### Setup pip so that TF can be installed ##############################################
sudo apt-get -y install python-pip python-virtualenv

### Install via R keras
sudo su - -c "R -e \"keras::install_keras()\""
 
### install spark, via sparklyr
sudo su - -c "R -e \"sparklyr::spark_install(version = '2.2.0')\""

