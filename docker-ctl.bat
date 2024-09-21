@echo off
:: Script to start, stop, restart, or build Docker Compose services

:menu
echo ==============================
echo Select an option:
echo 1. Start Docker Compose
echo 2. Stop Docker Compose
echo 3. Restart Docker Compose
echo 4. Start Docker Compose with --build
echo ==============================
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto start
if "%choice%"=="2" goto stop
if "%choice%"=="3" goto restart
if "%choice%"=="4" goto build
echo Invalid choice, please try again.
goto menu

:start
echo Starting Docker Compose...
docker-compose up -d
goto end

:stop
echo Stopping Docker Compose...
docker-compose down
goto end

:restart
echo Restarting Docker Compose...
docker-compose down
docker-compose up -d
goto end

:build
echo Starting Docker Compose with build...
docker-compose up --build -d
goto end

:end
echo Operation completed.
pause
