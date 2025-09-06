# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution & restore
COPY *.sln .
COPY Playground.csproj Playground.csproj
RUN dotnet restore

# Copy source & publish
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Expose port
EXPOSE 80

ENTRYPOINT ["dotnet", "Playground.dll"]
