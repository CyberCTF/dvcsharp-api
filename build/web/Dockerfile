# Upstream's Dockerfile (app/Dockerfile) with two changes:
# - its base microsoft/dotnet is gone from Docker Hub, so it builds FROM the .NET Core 2.1 SDK
#   on Microsoft's registry (the project targets netcoreapp2.0, which rolls forward to 2.1);
# - COPY reads app/.
FROM mcr.microsoft.com/dotnet/core/sdk:2.1
LABEL MAINTAINER "Appsecco"

ENV ASPNETCORE_URLS=http://0.0.0.0:5000

COPY app/ /app

WORKDIR /app

RUN dotnet restore \
    && dotnet ef database update

EXPOSE 5000

CMD ["dotnet", "watch", "run"]
