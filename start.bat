@echo off
cd /d "%~dp0"

echo ==========================================
echo  BACKROOMS hunt - local server launcher
echo ==========================================
echo.
echo Working folder:
echo   %cd%
echo.

REM --- check files exist ---
if not exist "index.html" (
  echo [X] index.html NOT found in this folder.
  echo     Put this .bat next to index.html and the .fbx files.
  echo.
  goto END
)
echo [OK] index.html found.
echo.

REM --- try python, then py ---
echo Trying to start server with "python"...
python --version
if %errorlevel%==0 (
  start "" http://localhost:8000
  echo.
  echo Server starting on http://localhost:8000
  echo Close this window to stop.
  echo.
  python -m http.server 8000
  goto END
)

echo "python" not available, trying "py"...
py --version
if %errorlevel%==0 (
  start "" http://localhost:8000
  echo.
  echo Server starting on http://localhost:8000
  echo Close this window to stop.
  echo.
  py -m http.server 8000
  goto END
)

echo.
echo [X] Python was not found on this system.
echo     Install Python from https://www.python.org/downloads/
echo     IMPORTANT: tick "Add python.exe to PATH" during install.

:END
echo.
pause
