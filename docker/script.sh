#!/bin/bash
echo '1.install Docker'
sudo apt-get install docker.io -y
#echo '2.Update system'
#sudo apt-get update
echo '3.Update apt and add packets in order to apt use repo with HTTPS'
sudo apt-get install 
sudo apt-transport-https \
sudo ca-certificates \
sudo curl gnupg-agent software-properties-common -y
echo '4.GPG Docker'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo '5.Fingerprint'
sudo apt-key fingerprint 0EBFCD88
echo '6.add stable repo'
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo '7.update apt'
sudo apt-get update
echo '8.Install latest Docker version'
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
echo '9.enable docker'
sudo systemctl enable docker
#echo '10.check Docker status'
#sudo systemctl status docker
echo '11.run Docker with jupyter notebook'
sudo docker run -d -p 8888:8888 jupyter/tensorflow-notebook
echo '12.create project_folder'
sudo mkdir project_folder
echo '13.move to folder'
cd project_folder
echo '14.create Dockerfile'
sudo touch Dockerfile
sudo chmod 777 Dockerfile
sudo echo 'FROM jupyter/minimal-notebook' > Dockerfile
echo 'RUN pip install preprocess1' > Dockerfile
echo '15.Build Docker image'
sudo docker build -t jupyter/tensorflow-notebook .
echo '16.Run jupyter notebook'
sudo docker run -d --name datascience -p 9999:9999 jupyter/tensorflow-notebook
#docker run -d -p 8888:8888 jupyter/tensorflow-notebook start-notebook.sh --NotebookApp.token=''
#ssh -N -f -L localhost:8889:dockerContainerIpAdress:8889 username@ remote_host_name
#ssh -N -f -L localhost:8888:172.17.0.4:8888 vagrant@clienteUbuntu