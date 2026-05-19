@echo off
TITLE AI Travel Management - Multi-Backend Launcher 2026
color 0A
echo.
echo ============================================================
echo   AI TRAVEL MANAGEMENT SYSTEM - Backend Launcher 2026
echo ============================================================
echo.

:: -- Set Python path (prefer venv) --------------------------------
set "PYTHON_EXE=python"
if exist "%~dp0venv\Scripts\python.exe" (
    set "PYTHON_EXE=%~dp0venv\Scripts\python.exe"
    echo [INFO] Using virtual environment: %~dp0venv
) else (
    echo [WARN] Virtual environment not found. Using global python.
)

:: -- Install Dependencies ------------------------------------------
echo [DEPS] Ensuring all dependencies are installed...
"%PYTHON_EXE%" -m pip install -r "%~dp0requirements.txt" >nul 2>&1
if exist "%~dp0flight-delay-project\requirements.txt" (
    "%PYTHON_EXE%" -m pip install -r "%~dp0flight-delay-project\requirements.txt" >nul 2>&1
)
echo [DEPS] Done.

:: -- Kill any existing processes on our ports ----------------------
echo [CLEANUP] Stopping any existing backend processes...
for /f "tokens=5" %%a in ('netstat -aon 2^>nul ^| findstr ":5000 " ^| findstr LISTENING') do (
    taskkill /f /pid %%a >nul 2>&1
)
for /f "tokens=5" %%a in ('netstat -aon 2^>nul ^| findstr ":5001 " ^| findstr LISTENING') do (
    taskkill /f /pid %%a >nul 2>&1
)
for /f "tokens=5" %%a in ('netstat -aon 2^>nul ^| findstr ":5002 " ^| findstr LISTENING') do (
    taskkill /f /pid %%a >nul 2>&1
)
for /f "tokens=5" %%a in ('netstat -aon 2^>nul ^| findstr ":5003 " ^| findstr LISTENING') do (
    taskkill /f /pid %%a >nul 2>&1
)
echo [CLEANUP] Done. Waiting 2 seconds...
timeout /t 2 /nobreak >nul

:: ==================================================================
:: PORT 5000 - Main Backend
:: Handles: Book Flight, My Bookings, Risk Advisor, Price Trends,
::          Flight Tracker, AI Travel Assistant (Chatbot)
:: ==================================================================
echo [1/4] Launching Main Backend (incl. AI Chatbot) on Port 5000...
start "Main-Backend-5000" /D "%~dp0backend" "%PYTHON_EXE%" app.py
timeout /t 3 /nobreak >nul

timeout /t 3 /nobreak >nul

:: ==================================================================
:: PORT 5001 - Visa System
:: Handles: Visa Manager, Discover (recommendations)
:: ==================================================================
echo [2/4] Launching Visa System on Port 5001...
start "Visa-System-5001" /D "%~dp0backend\visa_system" "%PYTHON_EXE%" app.py
timeout /t 3 /nobreak >nul
:: ==================================================================
echo [3/4] Launching Flight Delay Prediction on Port 5002...
start "Delay-Predictor-5002" /D "%~dp0flight-delay-project\src" cmd /c "%PYTHON_EXE% api.py || pause"
timeout /t 3 /nobreak >nul

:: ==================================================================
:: PORT 5003 - Blockchain Module start_all_backends.bat
:: Handles: Blockchain ticketing, ticket verification
:: ==================================================================
echo [4/4] Launching Blockchain Module on Port 5003...
start "Blockchain-Auth-5003" /D "%~dp0backend" "%PYTHON_EXE%" blockchain_module.py
timeout /t 3 /nobreak >nul

echo.
echo ============================================================
echo   ALL 4 BACKENDS LAUNCHED SUCCESSFULLY!
echo ============================================================
echo.
echo   Port 5000 - Main Backend (Flights, Bookings, AI Chatbot, Risk)
echo   Port 5001 - Visa System (Visa Manager, Discover)
echo   Port 5002 - Flight Delay Predictor (ML Model)
echo   Port 5003 - Blockchain Module (Ticket Verification)
echo.
echo   Frontend: Run 'npm run dev' for http://localhost:5173
echo.
echo   Keep all 4 terminal windows OPEN during your demo.
echo ============================================================
echo.
pause
