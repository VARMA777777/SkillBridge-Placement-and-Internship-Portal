@echo off
echo ============================================
echo  SkillBridge - Windows Setup ^& Run
echo ============================================
echo.

:: Step 1: Clean up macOS artifacts if present
echo [Step 1] Cleaning macOS metadata files...
for /r %%f in (._*) do del /f /q "%%f" 2>nul
for /r %%f in (.DS_Store) do del /f /q "%%f" 2>nul
for /d /r %%d in (__MACOSX) do rd /s /q "%%d" 2>nul
echo          Done.
echo.

:: Step 2: Check for Node.js
echo [Step 2] Checking Node.js installation...
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo.
    echo  ERROR: Node.js is not installed!
    echo  Please download and install Node.js from:
    echo  https://nodejs.org/
    echo.
    pause
    exit /b 1
)
for /f "tokens=*" %%v in ('node -v') do echo          Found Node.js %%v
echo.

:: Step 3: Install dependencies
echo [Step 3] Installing dependencies...
call npm install
if %ERRORLEVEL% neq 0 (
    echo.
    echo  ERROR: npm install failed!
    echo  Please check the error above.
    echo.
    pause
    exit /b 1
)
echo          Done.
echo.

:: Step 4: Start the dev server
echo [Step 4] Starting development server...
echo.
echo  The app will open at: http://localhost:8080
echo  Press Ctrl+C to stop the server.
echo ============================================
echo.
call npm run dev
