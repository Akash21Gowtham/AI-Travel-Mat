@echo off
echo Starting Visa Management Backend (Port 5001)...
cd /d "%~dp0backend\visa_system"
pip install reportlab apscheduler fpdf flask flask-cors pandas scikit-learn numpy joblib -q
python app.py
