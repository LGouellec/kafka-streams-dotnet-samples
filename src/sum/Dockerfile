﻿FROM mcr.microsoft.com/dotnet/runtime:6.0-alpine AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS build
WORKDIR /src
COPY ["sum.csproj", "sum/"]
RUN dotnet restore "sum/sum.csproj"
COPY ["Program.cs", "sum/"]
WORKDIR "/src/sum"
RUN dotnet build "sum.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "sum.csproj" -c Release -o /app/publish

FROM base AS final
ARG ROCKSDB_VERSION=v7.4.3
WORKDIR /app
RUN apk add --no-cache rocksdb libstdc++
RUN ln -s /usr/lib/librocksdb.so.7 /usr/lib/librocksdb.so
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "sum.dll"]
