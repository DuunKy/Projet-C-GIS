FROM duunky/dunkyandfilscorporation:BDD-GIS
WORKDIR /app
COPY . /app 
ADD lancement.sql /docker-entrypoint-initdb.d
EXPOSE 3306