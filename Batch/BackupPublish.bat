@echo off
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
echo datestamp: "%datestamp%"
echo timestamp: "%timestamp%"
echo fullstamp: "%fullstamp%"
REM got date now do backup

REM Setup Variables
set backupFolder=D:\j
set sourceFolder=\\j
set publishFolder=D:\j

echo Backup Folder: %backupFolder%%fullstamp%\
echo Source Folder: %sourceFolder%
echo Pubish Folder: %publishFolder%
echo Verify
pause

@echo backuping files
@xcopy /j /c /y /s %publishFolder% %backupFolder%%fullstamp%\
pause

@echo Publishing
@xcopy /j /c /y /s /exclude:exclude.txt %sourceFolder% %publishFolder%
@echo 
pause