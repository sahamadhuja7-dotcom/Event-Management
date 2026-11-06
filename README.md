# 🎓 CampusConnect – College Event Management & Discovery Platform

> **Discover. Connect. Participate.**  
> A centralized, modern, responsive full-stack web application designed for students and college organizers to discover, explore, manage, and register for inter-collegiate events, hackathons, cultural festivals, sports tournaments, and academic summits.

---

## 🌟 Key Features

### 1. 🧑‍🎓 Student Authentication & Profiles
- **Dedicated Registration & Login**: Captures all 9 academic student attributes: Full Name, Institutional Email, Password, Confirm Password, College Name, Course / Degree, Department / Stream, Academic Year (1st–4th year), and Contact Number.
- **Security**: Strong Werkzeug password hashing, session tokens, and input validations.
- **Personalized Profile**: Update degree, department, phone, and preferred metropolitan discovery region.

### 2. 📍 Location-Aware Event Discovery
- **Browser Geolocation API**: Safe, non-invasive location detection requesting user permission with gentle fallback options.
- **Accurate Haversine Calculations**: Computes real-time distance in kilometers (`km`) between student and campus venues.
- **Distance Radius Filtering**: Filter events within **5 km**, **10 km**, **25 km**, and **50 km**.
- **Interactive Leaflet & OpenStreetMap**: Visualizes host colleges and student coordinates with interactive map markers and event preview popups.
- **Manual Hub Selection**: Quick-switch between educational zones (South Delhi, Connaught/Central, North Campus, Noida, Gurugram, etc.) or custom college names.

### 3. 🎯 Student Dashboard
- **Personalized Welcome & Metadata**: Displays student name, enrolled college, course, department, year, and active location badge.
- **4 Real-Time Metric Counters**: Upcoming Events, Events in My College, Nearby College Events, and My Registered Events.
- **Multi-Tab Event Exploration**:
  - ⭐ **Featured Events**: Handpicked flagship summits and hackathons.
  - 🏛️ **In My College**: Internal departmental fests and competitions.
  - 🛣️ **Nearby Colleges**: Cross-campus events sorted by physical proximity.
  - 🔥 **Popular & Trending**: Ranked by live student registration counts.
  - ✨ **Recommended For You**: Stream-aligned suggestions (e.g., AI hackathons for CSE/IT students).

### 4. 🎟️ Registration & Digital Gate Pass System
- **1-Click Registration**: Validates capacity, deadlines, active event status, and prevents duplicate enrollments.
- **Unique Registration ID Generator**: Formats human-readable alphanumeric passes (e.g., `CC-1-8A9F2B`).
- **Digital Gate Pass**: Built-in modal with QR code visualization and printable verified pass for college security gates.
- **My Events Section**: Tabbed view for **Upcoming Events**, **Completed Events**, and **Cancelled Registrations** with one-click seat cancellation that releases capacity back to the community.

### 5. 🛡️ Organizer Management Portal
- **Role-Based Access Control**: Ordinary students cannot modify or create events; authorized college coordinators have dedicated administration capabilities.
- **Event Lifecycle Management**: Create events with custom banners, dates, venues, capacities, registration deadlines, and fees.
- **Attendance & Rosters**: View real-time attendee tables with participant name, email, department, year, and registration ID.
- **CSV Data Export**: One-click download of attendance rosters for event check-in desks.

---

## 🏗️ Technology Stack

| Layer | Technologies |
|---|---|
| **Frontend** | HTML5, Modern CSS3 (Grid, Flexbox, Custom Properties), JavaScript (ES6+ Fetch API, Browser Geolocation API), Leaflet JS, FontAwesome 6 |
| **Backend** | Python 3.12, Flask, Flask-SQLAlchemy, Flask-CORS, Werkzeug Security, python-dotenv |
| **Database** | SQLite3 (`instance/campusconnect.db`) with SQLAlchemy ORM |
| **Architecture** | RESTful API + Decoupled Static Frontend with Single-Server serving support |

---

## 📁 Project Directory Structure

```text
CampusConnect/
│
├── frontend/
│   ├── index.html              # Landing page & public event catalog
│   ├── login.html              # Student & organizer login (with 1-click demo logins)
│   ├── register.html           # 9-field academic registration form
│   ├── dashboard.html          # Personalized student dashboard with tabs & map
│   ├── event-details.html      # Detailed event page with countdown & venue map
│   ├── my-events.html          # My registrations (Upcoming, Completed, Cancelled)
│   ├── profile.html            # Profile & location preferences editor
│   ├── organizer.html          # Organizer management hub & attendee rosters
│   │
│   ├── css/
│   │   ├── style.css           # Global design system & responsive layout
│   │   ├── auth.css            # Split authentication screen styling
│   │   └── dashboard.css       # Dashboards, cards, ticket passes & table styles
│   │
│   ├── js/
│   │   ├── main.js             # API resolver, auth tokens, toasts & navbar
│   │   ├── auth.js             # Login, register, demo credentials handler
│   │   ├── events.js           # Event fetching, card rendering & registrations
│   │   ├── location.js         # Geolocation API, Haversine & Leaflet maps
│   │   └── profile.js          # User profile loader & location updater
│   │
│   └── assets/
│       └── images/             # Vector icons and project assets
│
├── backend/
│   ├── app.py                  # Flask application entry point & static server
│   ├── models.py               # Student, Organizer, Event, Registration models
│   ├── database.py             # SQLAlchemy instance initialization
│   ├── auth.py                 # Authentication & authorization endpoints
│   ├── events.py               # Event search, filter, and CRUD APIs
│   ├── registrations.py        # Enrollment, cancellation & roster APIs
│   ├── location.py             # Haversine distance & college coordinate resolver
│   ├── seed_data.py            # Sample data seeder (5+ colleges, 12+ events)
│   └── requirements.txt        # Python backend dependencies
│
├── instance/
│   └── campusconnect.db        # SQLite development database
│
├── .env.example                # Environment variables template
├── .gitignore                  # Git exclusions for Python & environment
└── README.md                   # Complete documentation & deployment guide
```

---

## ⚡ Quick Start & Local Setup

### 1. Prerequisites
- Python 3.10+ installed.

### 2. Clone the Repository
```bash
git clone https://github.com/your-username/CampusConnect.git
cd CampusConnect
```

### 3. Install Backend Dependencies
```bash
cd backend
pip install -r requirements.txt
```

### 4. Configure Environment
Copy the example environment configuration:
```bash
cp .env.example .env
```
*(On Windows PowerShell: `Copy-Item .env.example .env`)*

### 5. Launch the Application
Run the backend from the `backend/` directory:
```bash
python app.py
```

The server will automatically:
1. Initialize the SQLite database at `instance/campusconnect.db`.
2. Seed realistic demonstration colleges, organizers, students, and events.
3. Start serving the full web application at:
👉 **`http://127.0.0.1:5000`**

Open **`http://127.0.0.1:5000`** in any web browser!

---

## 🧪 Demo Accounts for Instant Testing

For quick grading and review, the login page includes **1-Click Quick Demo Login buttons**:

| Account Type | Email | Password | Role / Affiliation |
|---|---|---|---|
| **Student** | `aarav.student@campusconnect.edu` | `password123` | Student at Apex Institute of Technology |
| **Student 2** | `diya.patel@campusconnect.edu` | `password123` | Student at Metropolitan University |
| **Organizer** | `organizer@apex.edu` | `password123` | Faculty Organizer at Apex Institute |
| **Organizer 2** | `events@horizon.edu` | `password123` | Organizer at Horizon Global College |

---

## 🌐 Deployment Instructions

### Option A: Unified Full-Stack Deployment (Render / Railway / VPS)

Deploying both the Flask API and static frontend on a single service is the simplest and most robust approach:

1. Create a new **Web Service** on [Render](https://render.com) or [Railway](https://railway.app).
2. Connect your GitHub repository.
3. Configure the build and start commands:
   - **Build Command**: `pip install -r backend/requirements.txt`
   - **Start Command**: `gunicorn --chdir backend app:app --bind 0.0.0.0:$PORT`
4. Set Environment Variables in the hosting dashboard:
   - `SECRET_KEY`: `generate-a-strong-random-key`
   - `FLASK_ENV`: `production`
5. The Flask backend will serve both the `/api/*` endpoints and all `frontend/` HTML/CSS/JS pages directly on your public Render URL.

---

### Option B: Decoupled Deployment (GitHub Pages + Render Backend)

If you prefer hosting the frontend statically on **GitHub Pages**:

#### Step 1: Deploy Backend to Render
1. Deploy the `backend/` folder to Render as a Web Service.
2. Note your backend URL (e.g., `https://campusconnect-api.onrender.com`).
3. Set environment variable:
   - `CORS_ORIGIN`: `https://<your-username>.github.io`

#### Step 2: Configure Frontend for GitHub Pages
1. In `frontend/js/main.js`, update `getApiBaseUrl()` or set the URL in the browser console / configuration:
   ```javascript
   localStorage.setItem('CAMPUSCONNECT_API_URL', 'https://campusconnect-api.onrender.com');
   ```
2. Enable GitHub Pages on your repository:
   - Go to **Settings** > **Pages**.
   - Source: Deploy from a branch (`main` / `/frontend` or root).
3. Open `https://<your-username>.github.io/<repo-name>/frontend/index.html`.
4. The frontend will communicate seamlessly with your Render backend over HTTPS with full CORS support!

---

## 🔒 Security & Best Practices
- **Password Protection**: Passwords are never stored in plain text; hashed using Werkzeug (`scrypt` / `pbkdf2:sha256`).
- **SQL Injection Prevention**: SQLAlchemy parameterized ORM queries prevent SQL injection across all endpoints.
- **Session Protection**: Dual support for HTTP-only cookies and Bearer tokens for cross-origin security.
- **Role-Based Guards**: Protected endpoints verify user role before permitting event creation, cancellation, or roster exports.
- **Privacy First**: Exact GPS coordinates are never stored permanently; only approximate city / district coordinates are retained for distance calculation.

---

## 📄 License
This project is open-source under the MIT License. Built with ❤️ for college student communities.

