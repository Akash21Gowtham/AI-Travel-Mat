@echo off
echo Starting Flight Booking Backend (Port 5000)...
cd /d "%~dp0backend"
pip install -r ..\requirements.txt
if exist ..\flight-delay-project\requirements.txt (
    pip install -r ..\flight-delay-project\requirements.txt
)
python app.py || pause
