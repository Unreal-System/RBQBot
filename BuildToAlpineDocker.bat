@Echo off
set base_dir=%~dp0
del /F /S /Q ..\app\
dotnet publish -r linux-musl-x64 -c release -o /app -p:SelfContained=true -p:PublishTrimmed=false -p:PublishReadyToRun=true -p:PublishSingleFile=true
cd ..
cd app
del RBQBot.pdb /Q /F
cd ..
cd RBQBot
copy .\Dockerfile .\..\app\
Echo Please Use This Command On WSL2 Build To File
Echo sudo su
Echo docker build -t=app .
Echo docker image save -o rbqbot.tar OnUpBuildOutputID
pause.