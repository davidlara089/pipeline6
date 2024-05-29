# syntax=docker/dockerfile:1

FROM nginx
WORKDIR /jenkins-deploy/holamundo.java
COPY holamundo.java /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
