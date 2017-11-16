### Install nginx
sudo apt-get update
sudo apt-get -y install nginx


### install R, voeg toe aan trusted lijst
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
# add keys
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
# install
sudo apt-get update
sudo apt-get -y install r-base

### user was already created in cloud-config
cd /home/ruser/

### install RStudio
sudo apt-get -y install libapparmor1 gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.383-amd64.deb
sudo gdebi --n /home/ruser/rstudio-server-1.1.383-amd64.deb

### Install dataiku
cd /home/ruser/
wget https://downloads.dataiku.com/public/studio/4.1.0/dataiku-dss-4.1.0.tar.gz
tar xzf /home/ruser/dataiku-dss-4.1.0.tar.gz
### needs to be installed not as root
sudo -u ruser -i "/home/ruser/dataiku-dss-4.1.0/scripts/install/install-deps.sh"
sudo -u ruser '/home/ruser/dataiku-dss-4.1.0/installer.sh -d dataikudir -p 11000'


### install additional R packages
# installeer dependencies om devtools te kunnen installeren
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev
# packages
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
