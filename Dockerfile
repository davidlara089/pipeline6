# syntax=docker/dockerfile:1

FROM nginx
WORKDIR /jenkins-deploy/index.html
COPY index.html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
