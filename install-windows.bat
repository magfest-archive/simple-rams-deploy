@echo off
setlocal enableDelayedExpansion
PATH=%PATH%;C:\Program Files (x86)\Git\bin\;C:\Program Files\Git\bin\;C:\Program Files (x86)\Git\usr\bin\;C:\Program Files\Git\usr\bin\

for /F "tokens=*" %%A in (valid_eventnames.txt) do (
	set valid_eventnames=%%A;!valid_eventnames!
)
set valid_eventnames=;%valid_eventnames%

IF "%1"=="" goto :no_argument

call set "test=%%valid_eventnames:;%~1;=%%"
if "%test%" neq "%valid_eventnames%" goto :valid_eventname

goto :invalid_argument

:no_argument
echo You need to specify an event name when running this command

:invalid_argument
echo you need to specify an eventname of one of the following: %valid_eventnames%
goto :usage

:usage
echo usage: "%0 EVENT_NAME"
goto :end

:valid_eventname
echo installling event_name=%1%
REM ------------------------------------ real stuff starts below --------------------

git clone https://github.com/magfest/ubersystem-deploy || goto :error

cd ubersystem-deploy || goto :error

vagrant up || goto :error

copy ..\installfiles\run-simple-deploy.sh . || goto :error

set "vm_cmd=cd ~/uber/ ^&^& ./run-simple-deploy.sh %1% ^&^& rm -f ./run-simple-deploy.sh"
vagrant ssh -c '%vm_cmd%' || goto :error

start http://localhost:8000/uber/accounts/insert_test_admin || goto :error

echo "deploy should be finished"
goto :end

:error
echo deploy FAILED with error #%errorlevel%.

:end
pause
exit /b %errorlevel%
