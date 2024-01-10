#!/bin/bash

# Démarrer Nginx en arrière-plan
nginx -g 'daemon off;' &

# Démarrer votre application .NET Core (remplacez cette ligne par la commande spécifique à votre application)
dotnet run --project /API/
