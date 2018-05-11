# compile R from source

# on DO machine
ssh root@167.99.218.245

## add to source list
sudo sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list' 

## install dependencies
sudo apt-get update
sudo apt-get -y build-dep r-base

## get the source code and unpack
wget https://cloud.r-project.org/src/base/R-3/R-3.5.0.tar.gz
tar -xvzf   R-3.5.0.tar.gz

cd R-3.5.0

## make
./configure --prefix=/opt/R/3.5.0 --enable-R-shlib --with-blas --with-lapack
make
sudo make install

## link
sudo ln -s /opt/R/3.5.0/bin/R /bin/R 
