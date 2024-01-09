FROM duunky/dunkyandfilscorporation:server-web-GIS
WORKDIR /
# RUN mkdir /API
COPY index.html /usr/share/nginx/html/
COPY installationDotNet.sh /
COPY api /API
ADD installationDotNet.sh /docker-entrypoint.d
RUN chmod +x /docker-entrypoint.d/installationDotNet.sh
RUN /docker-entrypoint.d/installationDotNet.sh
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]