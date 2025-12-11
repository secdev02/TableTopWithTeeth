REM AtomicRedTeamTools
REM Run as administrator 
REM Use a single 'x' as the password for all certificates for simplicity.

PATH %PATH%;"..";

copy .\originals\*.*

makecert -r -pe -n "CN=AtomicRedTeamTools_Simulation_CA" -ss CA -sr CurrentUser ^
   -a sha256 -cy authority -sky signature ^
   -sv AtomicRedTeamTools_CA.pvk AtomicRedTeamTools_CA.cer

makecert -pe -n "CN=AtomicRedTeamTools_Simulation_SPC" -a sha256 -cy end ^
   -sky signature ^
   -ic AtomicRedTeamTools_CA.cer -iv AtomicRedTeamTools_CA.pvk ^
   -sv AtomicRedTeamTools_SPC.pvk AtomicRedTeamTools_SPC.cer

pvk2pfx -pvk AtomicRedTeamTools_SPC.pvk -spc AtomicRedTeamTools_SPC.cer ^
   -pfx AtomicRedTeamTools_SPC.pfx ^
   -po x

signtool sign /as /d "description" /du "AtomicRedTeamTools_Simulation" ^
   
   /f AtomicRedTeamTools_SPC.pfx ^
   /p x ^
   /v DotNetToJScript.exe
   
signtool sign /as /d "description" /du "AtomicRedTeamTools_Simulation" ^
   /fd SHA256 ^
   /f AtomicRedTeamTools_SPC.pfx ^
   /p x ^
   /v NDesk.Options.dll
   
signtool sign /as /d "description" /du "AtomicRedTeamTools_Simulation" ^
   /fd SHA256 ^
   /f AtomicRedTeamTools_SPC.pfx ^
   /p x ^
   /v CreateAddInIpcData.exe
   
signtool sign /as /d "description" /du "AtomicRedTeamTools_Simulation" ^
   /fd SHA256 ^
   /f AtomicRedTeamTools_SPC.pfx ^
   /p x ^
   /v CommonLib.dll
   

certutil -addstore Root AtomicRedTeamTools_CA.cer

certutil -delstore Root AtomicRedTeamTools_CA