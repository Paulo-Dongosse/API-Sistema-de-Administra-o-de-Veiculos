# --- STAGE 1: Build (Usado para compilar o código) ---
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia o arquivo de projeto e restaura as dependências
# A Minimal API está na pasta atual, então usamos o nome do arquivo .csproj
COPY "minimal-api.csproj" .
RUN dotnet restore

# Copia o restante do código-fonte
COPY . .

# Publica a aplicação
RUN dotnet publish "minimal-api.csproj" -c Release -o /app/publish

# --- STAGE 2: Final (Usado para executar a aplicação) ---
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# A porta padrão para apps .NET em containers é 8080 no .NET 8
EXPOSE 8080 

# Copia os arquivos publicados da fase de build
COPY --from=build /app/publish .

# Comando para iniciar a aplicação (substitua minimal-api.dll pelo nome da sua DLL final)
ENTRYPOINT ["dotnet", "minimal-api.dll"]