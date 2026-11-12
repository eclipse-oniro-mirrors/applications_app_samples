@echo off
rem Copyright (c) 2026 Huawei Device Co., Ltd.
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.
rem
rem Wrapper for the DevEco bundled hvigor CLI.
rem - The module of this repository is "tv", while the sibling sample uses "entry".
rem   Any "-p module=entry@..." argument is rewritten to "tv@..." so the same
rem   command line works unchanged in both projects.
rem - After an ohosTest assembleHap, the unsigned hap is signed in place and
rem   copied to it, so "hdc install entry\build\...\entry-ohosTest-signed.hap"
rem   resolves through the "entry" directory junction.
setlocal enabledelayedexpansion

set "PROJECT_DIR=%~dp0"
if "%DEVECO_HOME%"=="" set "DEVECO_HOME=D:\Program Files\Huawei\DevEco Studio"
set "NODE_EXE=%DEVECO_HOME%\tools\node\node.exe"
set "HVIGOR_JS=%DEVECO_HOME%\tools\hvigor\bin\hvigorw.js"
set "SIGN_TOOL=%DEVECO_SDK_HOME%\18\toolchains\lib\hap-sign-tool.jar"
if "%DEVECO_SDK_HOME%"=="" set "SIGN_TOOL=D:\OpenHarmony\Sdk\18\toolchains\lib\hap-sign-tool.jar"

if not exist "%NODE_EXE%" (
  echo [ERROR] node.exe not found: "%NODE_EXE%"
  echo [ERROR] Set DEVECO_HOME to the DevEco Studio installation directory.
  exit /b 1
)
if not exist "%HVIGOR_JS%" (
  echo [ERROR] hvigorw.js not found: "%HVIGOR_JS%"
  exit /b 1
)

set "NODE_OPTIONS=--max-old-space-size=4096"
set "ARGS=%*"
rem Rewrite the legacy module selector without touching any other argument.
set "ARGS=%ARGS:entry@=tv@%"

pushd "%PROJECT_DIR%"
"%NODE_EXE%" "%HVIGOR_JS%" %ARGS%
set "RC=%ERRORLEVEL%"
if not "%RC%"=="0" (
  popd
  exit /b %RC%
)

echo %ARGS% | findstr /C:"ohosTest" >nul
if not errorlevel 1 call :SIGN_OHOSTEST
popd
exit /b 0

:SIGN_OHOSTEST
set "OUT_DIR=%PROJECT_DIR%product\tv\build\default\outputs\ohosTest"
set "UNSIGNED=%OUT_DIR%\tv-ohosTest-unsigned.hap"
if not exist "%UNSIGNED%" exit /b 0
if not exist "%SIGN_TOOL%" (
  echo [WARN] hap-sign-tool.jar not found, skip signing: "%SIGN_TOOL%"
  exit /b 0
)
if not exist "%PROJECT_DIR%entry" (
  echo [WARN] "entry" junction missing, skip copy to entry\build output
)
call :SIGN_ONE "%OUT_DIR%\tv-ohosTest-signed.hap"
if exist "%PROJECT_DIR%entry" call :SIGN_ONE "%PROJECT_DIR%entry\build\default\outputs\ohosTest\entry-ohosTest-signed.hap"
exit /b 0

:SIGN_ONE
java -jar "%SIGN_TOOL%" sign-app -keyAlias "OpenHarmony Application Release" -signAlg SHA256withECDSA -mode localSign -appCertFile "%PROJECT_DIR%sign\OpenHarmonyApplication.pem" -profileFile "%PROJECT_DIR%sign\cast.p7b" -inFile "%UNSIGNED%" -outFile "%~1" -keystoreFile "%PROJECT_DIR%sign\OpenHarmony.p12" -keyPwd 123456 -keystorePwd 123456 >nul
if errorlevel 1 (
  echo [WARN] sign failed for "%~1"
) else (
  echo [INFO] signed hap: "%~1"
)
exit /b 0
