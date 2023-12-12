FROM duunky/dunkyandfilscorporation:server-web-GIS
WORKDIR /usr/share/nginx/html/
COPY . /usr/share/nginx/html/
RUN apt-get update && apt upgrade -y 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
