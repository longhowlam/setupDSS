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

### install packages
# installeer dependencies om devtools te kunnen installeren
sudo apt-get -y install libcurl4-gnutls-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libssl-dev
# packages
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
