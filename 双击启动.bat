@echo off
chcp 65001

echo ...

echo 自动化启动中，不要做任何操作，等待就好...

start /b java -jar -Dspring.config.location=D:\Server\Root\config\cmsservice\application.yml  D:\Server\Root\cmsservice-0.0.1-SNAPSHOT.jar >> D:\Server\Root\log\cmsservice\catalina.out 2>&1 &

TIMEOUT /T 10 

echo ...

echo 注册服务启动完成，开始启动业务系统...

start /b  java -jar -Dspring.config.location=D:\Server\Root\config\eurakserver\application.yml  D:\Server\Root\eurakserver-0.0.1-SNAPSHOT.jar >> D:\Server\Root\log\eurakserver\catalina.out 2>&1 &

TIMEOUT /T 30 

echo ...



start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"  http://localhost:8001/

TIMEOUT /T 5

start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"  http://localhost/

echo 业务系统启动完成，此窗口不能关闭，关闭则会停止服务

exit