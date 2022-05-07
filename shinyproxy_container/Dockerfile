FROM openjdk:8-jre

# make shinyproxy directory
RUN mkdir -p /opt/shinyproxy/

# download shinyproxy jar and copy it to the shinyproxy directory
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.3.0.jar -O /opt/shinyproxy/shinyproxy.jar

# copy the configuration file
COPY application.yml /opt/shinyproxy/application.yml

# set working directory
WORKDIR /opt/shinyproxy/

# run shinyproxy
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]
