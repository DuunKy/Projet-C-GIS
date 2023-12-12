FROM duunky/dunkyandfilscorporation:server-web-GIS
WORKDIR /
RUN mkdir /API
COPY index.html /usr/share/nginx/html/
COPY installationDotNet.sh /
COPY API /API
ADD installationDotNet.sh /docker-entrypoint-initdb.d
RUN chmod +x /installationDotNet.sh
RUN ./installationDotNet.sh
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
