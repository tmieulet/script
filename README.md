# script

## DEV
To install docker, awscli, ...
```bash
curl -sSL https://raw.githubusercontent.com/tmieulet/script/master/dev.sh -o dev.sh
bash dev.sh
```
1. If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:
```bash
  sudo groupadd docker
  sudo usermod -aG docker your-user
```
2. Configure Docker to start on boot
```bash
  sudo systemctl enable docker
```

### Limitations
The docker script can fail and display "E: Package 'docker-ce' has no installation candidate". 
Please see the installation instructions : https://docs.docker.com/engine/installation/linux/


## validate-sam
This script uses git, maven, jdk and sam, see https://github.com/awslabs/aws-serverless-java-container.
```bash
 curl -sSL https://raw.githubusercontent.com/tmieulet/script/master/validate-sam.sh | sh
```
Ok if the service http://localhost:3000/pets is up.

## validate-docker
The Docker Bench for Security is a script that checks for dozens of common best-practices around deploying Docker containers in production.
```bash
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
sudo sh docker-bench-security.sh
```
