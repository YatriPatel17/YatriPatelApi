# Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# copy project file and restore it
COPY ["YatriPatelApi.csproj", "./"]
RUN dotnet restore "YatriPatelApi.csproj"

# copy everything and build it
COPY . .
RUN dotnet publish "YatriPatelApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

# runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# expose port 8080 inside the container
EXPOSE 8080

# Setiing environment variable
ENV ASPNETCORE_URLS=http://+:8080

# start the app
ENTRYPOINT ["dotnet", "YatriPatelApi.dll"]