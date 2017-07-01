@echo off

set Pasta=%CD%\
set Backup=%Pasta%Backup\
md "%Backup%"

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set dataAtual=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%
set horaAtual=%ldt:~8,2%%ldt:~10,2%

set pastaAtual=%dataAtual%_%horaatual%

rem icacls %CD%\* /grant :r "Todos":(F,WDAC) /T

set app=TreinamentoDataSnap
set Destino=\
rem set zipa=-air!*.zip -air!*.rar -air!*.local 7z.exe gdrive.exe curl.exe *.group* *.dpr* *.pas *.fmx *.dfm *.vsr *.dcr *.dpk *.res *.skin* *.ini *.bat *.txt *.ico *.dll *.xml *.htm* *.sql* *.log *.mes *.el* *.ep* *.vlb *.bmp *.png *.jp* *.pdf *.csv *.xls* *.js* *.cs* *.doc* *.sdb *.db3 *.sqlite *.fdb *.gdb *.inc *.cbk *.style *.dres *.rc *.key* *.mob* *.apk *.ipa *.cer *.bak *.deploy* *.ppt* *.doc* *.xls* *.dat *.reg *.chm *.dylib *.bpl *.hpp *.md *.ma* *.sc* *.cs* *.eot *.svg *.tt* *.wo* *.y* *.l* *.nu* *.ps* *.ed* *.es* *.inf* *.np*
set zipa=-axr*.zip -axr*.rar -axr*.local 7z.exe gdrive.exe curl.exe *.group* *.dpr* *.pas *.fmx *.dfm *.vsr *.dcr *.dpk *.res *.skin* *.ini *.bat *.txt *.ico *.dll *.xml *.htm* *.sql* *.log *.mes *.el* *.ep* *.vlb *.bmp *.png *.jp* *.pdf *.csv *.xls* *.js* *.cs* *.doc* *.sdb *.db3 *.sqlite *.fdb *.gdb *.inc *.cbk *.style *.dres *.rc *.key* *.mob* *.apk *.ipa *.cer *.bak *.deploy* *.ppt* *.doc* *.xls* *.dat *.reg *.chm *.dylib *.bpl *.hpp *.md *.ma* *.sc* *.cs* *.eot *.svg *.tt* *.wo* *.y* *.l* *.nu* *.ps* *.ed* *.es* *.inf* *.np*
rem set zipa=-air!*.zip -air!*.rar -air!*.local 7z.exe gdrive.exe *.bat

7z.exe a -tzip -mcu=on "%Backup%%app%_%pastaAtual%_BackupFull.zip" -r %zipa% -scsWIN

pause
