#!/bin/bash

function FONCYES ()
{
[ "$1" = "y" ] || [ "$1" = "Y" ]
}

function FUNC_INSTALL_DOCKER ()
{
curl -sSL https://get.docker.com/ | sh
# now install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
}


function FONC_INSTALL ()
{

 apt-get update
	if ! hash curl 2>/dev/null; then
	   echo "Install curl ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	     apt-get install -y curl
	   else
	    exit 1
	   fi
    fi
	if ! hash docker 2>/dev/null; then
	   echo "Install docker ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	     FUNC_INSTALL_DOCKER
	   fi
	fi
  
  if ! hash java 2>/dev/null; then
	   echo "Install openjdk8 and maven ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	     apt install -y  maven default-jdk
	   fi
	fi
  
  if ! hash npm 2>/dev/null; then
	   echo "Install npm and node8 ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	    apt install -y npm
	    # update npm
	    npm i -g npm
      npm install -g n
      n latest
	   fi
	fi
  
    if ! hash pip 2>/dev/null; then
	   echo "Install pip (required for aws-sam-cli, ..) ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	    apt install -y python-pip
	    # update to the last version (bad idea)
	    # keep 9.0.1-2 : https://github.com/pypa/pip/issues/5240
	    # pip install --upgrade pip
	    
	    export PATH=~/.local/bin:$PATH
	   fi
	fi
  
  if ! hash aws 2>/dev/null; then
	   echo "Install awscli ? [y/n]"
	   read -r RESPONSE
	   if FONCYES "$RESPONSE"; then
	     # apt install -y   awscli
	     pip install awscli --upgrade --user
	     aws --version
	   fi
	fi
  
  if ! hash sam 2>/dev/null; then
    echo "Install aws-sam-local ? [y/n]"
	  read -r RESPONSE
	  if FONCYES "$RESPONSE"; then
            pip install --user aws-sam-cli
	    sam --version
	    pip install --user --upgrade aws-sam-cli
          fi
  fi
  if ! hash localstack 2>/dev/null; then
    echo "Install localstack ? [y/n]"
	  read -r RESPONSE
	  if FONCYES "$RESPONSE"; then
            pip install --user localstack
	    localstack start --docker
          fi
  fi

}

FONC_INSTALL
