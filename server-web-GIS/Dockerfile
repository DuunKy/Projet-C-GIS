FROM duunky/dunkyandfilscorporation:server-web-GIS
WORKDIR /app
RUN apt-get update
RUN apt-get -y upgrade
COPY . /app
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80