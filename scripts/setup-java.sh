    #!/bin/bash

    #apt-get -y -q update
    #apt-get -y -q upgrade

    #apt-get -y -q install software-properties-common htop

    #add-apt-repository -y ppa:webupd8team/java
    #apt-get -y -q update

    #echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    #echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
    #apt-get -y -q install oracle-java8-installer
    
    #update-java-alternatives -s java-8-oracle

    add-apt-repository -y ppa:openjdk-r/ppa

    apt-get -y -q update
    
    apt-get -y install openjdk-8-jdk