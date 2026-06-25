@echo off
echo ============================================
echo  SkillBridge - macOS Artifact Cleanup Script
echo ============================================
echo.
echo This script removes macOS metadata files
echo (._* files, .DS_Store, __MACOSX folders)
echo that appear when extracting a zip from macOS.
echo.
echo These files are NOT part of the project and
echo are safe to delete.
echo.
echo ============================================

:: Remove all ._ prefixed files (AppleDouble metadata)
echo [1/3] Removing ._ metadata files...
for /r %%f in (._*) do (
    echo   Deleting: %%f
    del /f /q "%%f" 2>nul
)
echo       Done.

:: Remove .DS_Store files
echo [2/3] Removing .DS_Store files...
for /r %%f in (.DS_Store) do (
    echo   Deleting: %%f
    del /f /q "%%f" 2>nul
)
echo       Done.

:: Remove __MACOSX folders
echo [3/3] Removing __MACOSX folders...
for /d /r %%d in (__MACOSX) do (
    echo   Deleting folder: %%d
    rd /s /q "%%d" 2>nul
)
echo       Done.

echo.
echo ============================================
echo  Cleanup complete! You can now run:
echo    npm install
echo    npm run dev
echo ============================================
pause
