# Docker and Docker Compose Setup 

###Installing docker and docker compose by running sh file


```sh
git clone https://github.com/Muhammederendemir/docker-compose-setup.git
```

```sh
cd docker-compose-setup
```

####If you want Jenkins to be installed, the following command should be written.

```sh
sudo sed -i 's/JENKINS_ENABLED=false/JENKINS_ENABLED=yes/'  install-prereqs.sh 
```

####If you want Sonarqube to be installed, the following command should be written.
```sh
sudo sed -i 's/SONARQUBE_ENABLED=false/SONARQUBE_ENABLED=yes/'  install-prereqs.sh 
```

```sh
sudo chmod u+x *.sh
```

```sh
./install-prereqs.sh
```

#####To see that the installation is complete, you can check the versions with the following commands

```sh
docker version
```

```sh
docker-compose version
```


You can access the Playground from the following url.

http://app.info/playground

You can access the Jenkins from the following url.

http://jenkins.info/jenkins

You can access the Sonarqube from the following url.

http://sonarqube.info/sonarqube

