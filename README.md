
  ✈️ AI Travel Mat System

An advanced, full-stack travel management platform that leverages Artificial Intelligence and Blockchain technology to provide a seamless, secure, and intelligent booking experience. This project demonstrates a microservices architecture, integrating predictive ML models, decentralized ticketing, and an intuitive modern frontend.

## 🌟 Key Features

- **🧠 AI-Powered Flight Delay Prediction**: Uses machine learning to forecast potential flight delays, helping users make informed travel decisions (Risk Advancer).
- **⛓️ Blockchain Ticketing**: Ensures tamper-proof, secure ticket verification through a simulated blockchain ledger module.
- **🤖 Intelligent Chatbot**: A localized, zero-cost rule-based AI travel assistant to help users with queries, recommendations, and booking flows.
- **🛂 Visa & Discover System**: Dedicated microservice for managing visa applications and suggesting personalized travel destinations.
- **📊 Real-time Price Trends & Tracking**: Live price tracking and visualization using Recharts.
- **✨ Modern UI/UX**: Built with React, Vite, Tailwind CSS, and Radix UI for a glassmorphic, fully responsive dark-themed aesthetic.

## 🏗️ System Architecture & Microservices

The application is built on a decoupled architecture with a React frontend and four distinct Python backend services, communicating via RESTful APIs:

1. **Port 5000 - Main Service**: Handles core flight bookings, user ledger (SQLite), price trends, risk advising, and the AI chatbot.
2. **Port 5001 - Visa Service**: Manages visa-related workflows and destination discovery.
3. **Port 5002 - ML Predictor Service**: Hosts the Scikit-Learn based machine learning model for flight delay predictions.
4. **Port 5003 - Blockchain Service**: Provides decentralized ticket verification and authorization.

## 🛠️ Technology Stack

**Frontend:**
- React 18 & Vite
- Tailwind CSS & Radix UI (Glassmorphism design)
- Leaflet (Maps) & Recharts (Data Visualization)
- Framer Motion (Animations)

**Backend:**
- Python (Flask)
- SQLite (Persistent Database `travelmate.db`)
- Flask-CORS

**Machine Learning (Flight Delay Predictor):**
- Pandas, NumPy
- Scikit-Learn (Model training)
- MLflow (Experiment tracking)
- Evidently (Model monitoring)

## 🚀 Getting Started

### Prerequisites
- Node.js (v18+ recommended)
- Python 3.9+
- pip (Python package manager)

### 1. Clone the repository
```bash
git clone <your-repository-url>
cd "AI Travel Management App"
```

### 2. Backend Setup
The project includes a convenient batch script to install Python dependencies and spin up all microservices simultaneously.

```bash
# On Windows, simply run the launcher:
start_all_backends.bat
```
*(This script will launch 4 separate terminal windows for Ports 5000, 5001, 5002, and 5003. Keep them open during your session.)*

### 3. Frontend Setup
Open a new terminal in the project root:

```bash
# Install Node dependencies
npm install

# Start the Vite development server
npm run dev
```
The application will be available at `http://localhost:5173`.

## 📁 Project Structure

```text
AI Travel Management App/
├── backend/                  # Main backend, chatbot, and blockchain services
├── backend_ninjas/           # (or backend_visa_system) Visa & Discover microservice
├── flight-delay-project/     # ML models, training scripts, and prediction API
├── src/                      # React frontend source code
│   ├── app/                  # Main application views and routing
│   └── components/           # Reusable UI components
├── DataBase/                 # SQLite database storage (travelmate.db)
├── start_all_backends.bat    # Windows unified startup script
└── package.json              # Frontend dependencies and scripts
```

## 📝 Acknowledgements
- Original Figma design inspiration for the UI.
- Scikit-Learn for the machine learning pipeline used in the flight delay predictions.
  
