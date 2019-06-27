﻿Param ([string]$Version = "0.1-dev")
$ErrorActionPreference = "Stop"
pushd $PSScriptRoot\src

dotnet clean MyVendor.MyApp.sln
dotnet msbuild /t:Restore /t:Build /t:Publish /p:PublishDir=./obj/Docker/publish /p:Configuration=Release /p:Version=$Version MyVendor.MyApp.sln
dotnet test --no-build --configuration Release --logger "junit;LogFilePath=..\..\artifacts\test-results.xml" UnitTests\UnitTests.csproj

popd
