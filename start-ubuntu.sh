docker build . -t jenkinsdock

docker run -d -p 8080:8080 \
       -p 5000:5000 \
       -v jenkins:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       --restart always \
       --group-add 1000 --group-add 999 \
      jenkinsdock
