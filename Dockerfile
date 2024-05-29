# Usamos una imagen base de alpine, que es una distribución de Linux ligera
FROM alpine:latest

# Etiqueta para indicar quién es el mantenedor del Dockerfile
LABEL maintainer="davelara089 <laradave374@gmail.com>"

# Ejecutamos actualización de paquetes y luego instalamos un programa simple de ejemplo
RUN apk update && apk add --no-cache mi_programa

# Indicamos qué comando ejecutar cuando el contenedor se inicie
CMD ["Jenkinsfile"]
