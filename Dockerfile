FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y mc
RUN apt-get install -y nginx
RUN apt-get install -y default-jdk
RUN apt-get install -y tomcat8
RUN apt-get install -y git
RUN apt-get install -y maven
RUN mkdir build
WORKDIR /build
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
EXPOSE 8080
WORKDIR /build/boxfuse-sample-java-war-hello
#RUN cd /build
RUN mvn package
RUN cp /build/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat8/webapps/
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
#WORKDIR /usr/share/tomcat8/bin
CMD ["/usr/share/tomcat8/bin/catalina.sh", "start"]
#RUN cd target
#RUN cp /build/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat8/webapps/
#EXPOSE 8080
#CMD echo "Thjs is a test"
