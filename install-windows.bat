PATH=%PATH%;C:\Program Files (x86)\Git\bin\

git clone https://github.com/magfest/ubersystem-deploy || goto :error

cd ubersystem-deploy || goto :error

vagrant up || goto :error

copy ..\installfiles\run-simple-deploy.sh . || goto :error

vagrant ssh -c 'cd ~/uber/ ^&^& ./run-simple-deploy.sh ^&^& rm -f ./run-simple-deploy.sh' || goto :error

start http://localhost:8000/uber/accounts/insert_test_admin || goto :error

echo "deploy should be finished"
pause
exit


:error
echo Failed with error #%errorlevel%.
pause
exit /b %errorlevel%
