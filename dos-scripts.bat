:: Windows Batch Files (source : http://notes.tomcarlson.com/windows-batch)
:: Useful variables
%0 - the command used to call the batch file (could be foo, ..\foo, c:\bats\foo, etc.)
%1 is the first command line parameter,
%2 is the second command line parameter,
and so on till %9 (and SHIFT can be used for those after the 9th).
%~nx0 - the actual name of the batch file, regardless of calling method (some-batch.bat)
%~dp0 - drive and path to the script (d:\scripts)
%~dpnx0 - is the fully qualified path name of the script (d:\scripts\some-batch.bat)
%cmdcmdline% - exact command line used to start the current Cmd.exe
:: When launched from a command console, this var is "%SystemRoot%\system32.cmd.exe"
:: When launched from explorer this var is cmd /c ""[d:\path\script.bat]" "
