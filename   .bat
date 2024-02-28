@ECHO OFF
set "存储密码=766B76696E6179"  REM "huenanuehue" 的十六进制表示
if EXIST "控制面板.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto 解锁
if NOT EXIST Private goto 创建
:确认
echo 锁定文件夹 ( 1 / 0) ？ 
set /p "选择=>"
if %选择%==1 goto 锁定
if %选择%==0 goto 结束
goto 确认
:锁定
ren Private "控制面板.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "控制面板.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
REM taskkill /im explorer.exe /f
REM timeout /t 2 /nobreak >nul
cls
ie4uinit.exe -show
REM start explorer.exe
goto 结束
:解锁
echo 输入密码以 minamata nanue解锁您的 安全 文件 夹hue
set /p "密码=密码："
for /f "delims=" %%a in ('echo %密码% ^| certutil -encodehex -f -') do set "十六进制密码=%%a"
if NOT "%十六进制密码%"=="%存储密码%" goto 失败
attrib -h -s "控制面板.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "控制面板.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Private
goto 结束
:失败
echo 密码错误。安全文件夹仍然被锁定。 koshi文件夹仍然被锁定 minamata文件夹仍然被锁定
pause
goto 结束
:创建
md Private
goto 结束
:结束

REM VK x CG
