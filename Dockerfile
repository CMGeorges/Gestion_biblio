
# Utilisez une image SQL Server de Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Définissez la variable d'environnement pour le mot de passe SA
ENV SA_PASSWORD Gestion123456
ENV ACCEPT_EULA Y

# Créez le répertoire d'initialisation et copiez les scripts SQL
WORKDIR /usr/src/app
COPY . .

# Copiez les scripts SQL dans le répertoire d'initialisation
COPY ./scripts/create-database.sql /docker-entrypoint-initdb.d/1-create-database.sql
COPY ./scripts/gestion.sql /docker-entrypoint-initdb.d/2-gestion.sql
COPY ./scripts/insertion.sql /docker-entrypoint-initdb.d/3-insertion.sql
COPY ./scripts/*.sql /docker-entrypoint-initdb.d/


# Exécutez le script SQL pour créer la base de données
RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /docker-entrypoint-initdb.d/1-create-database.sql

# Exécutez le script SQL creation de roles
RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d Biblioteca -i /docker-entrypoint-initdb.d/2-gestion.sql
# Exécutez le script SQL d'insertion de données
RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d Biblioteca -i /docker-entrypoint-initdb.d/3-insertion.sql
