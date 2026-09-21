# VocabMaster - Interactive Vocabulary Learning Platform

A modern, web-based vocabulary learning application with pronunciation practice, printable worksheets, and listening exercises.

## 🚀 Features

### 1. Vocabulary List Management
- Create and manage multiple vocabulary lists
- Edit English/French word pairs with context sentences
- Import/Export lists (CSV, JSON)
- Text-to-Speech (TTS) for pronunciation

### 2. Pronunciation Evaluation Studio
- Real-time speech recognition using Web Speech API
- Pronunciation scoring with visual feedback
- Multiple voice engine support
- Waveform visualization during recording

### 3. A4 Printable Worksheets
- Professional print-ready worksheets
- Optimized for A4 paper format
- Student handwriting practice column
- Error tracking checkbox

### 4. Listening & Sentence Practice
- Context sentence audio playback
- Interactive dictation challenges
- Fill-in-the-blank exercises
- Translation reveal feature

## 📦 Current Deployment (Clever Cloud - Static)

### Prerequisites
1. Create a [Clever Cloud account](https://www.clever-cloud.com/)
2. Install Clever Cloud CLI:
   ```bash
   npm install -g clever-tools
   # OR download from https://github.com/CleverCloud/clever-tools
   ```

### Deploy Steps

1. **Login to Clever Cloud**
   ```bash
   clever login
   ```

2. **Create a static application**
   ```bash
   clever create --type static vocabmaster
   ```

3. **Deploy**
   ```bash
   git push clever main
   ```

4. **Access your app**
   ```bash
   clever open
   ```

### Configuration
The `.clever.json` file configures Clever Cloud to serve static files from the root directory.

## 🔮 Future Backend Integration Plans

This static prototype is designed to evolve into a full-stack application with either:

### Option A: Java/Spring Boot Backend
```
vocabmaster/
├── frontend/           # Current static site
│   └── index.html
├── backend/           # Future Spring Boot API
│   ├── src/main/java/
│   ├── pom.xml
│   └── application.properties
└── README.md
```

**Clever Cloud Migration:**
- Current: Static app (free tier)
- Future: Add Java runtime app
- Connect via API Gateway or direct backend calls

**Features to Add:**
- User authentication (Spring Security + JWT)
- Database persistence (PostgreSQL/MySQL)
- Advanced speech analysis (Azure Cognitive Services)
- Progress tracking and analytics
- Vocabulary sharing between users

### Option B: .NET/ASP.NET Core Backend
```
vocabmaster/
├── frontend/           # Current static site
├── backend/           # Future ASP.NET Core API
│   ├── Controllers/
│   ├── Models/
│   ├── Services/
│   └── Program.cs
└── README.md
```

**Clever Cloud Migration:**
- Current: Static app (free tier)
- Future: Deploy .NET app via Docker container
- Frontend calls backend REST API

**Features to Add:**
- Identity Server for authentication
- Entity Framework Core + SQL Server
- Azure Speech SDK integration
- SignalR for real-time features
- BLOB storage for audio files

## 🛠️ Technology Stack

### Current (Static POC)
- **Frontend:** Pure HTML5, CSS3 (Tailwind via CDN), Vanilla JavaScript
- **APIs:** Web Speech API (Recognition + Synthesis)
- **Hosting:** Clever Cloud Static

### Future Backend Stack
- **Java:** Spring Boot 3.x, Spring Security, Spring Data JPA
  - **OR**
- **.NET:** ASP.NET Core 8.x, Entity Framework Core, Identity
- **Database:** PostgreSQL or MySQL
- **AI/Speech:** Azure Cognitive Services, OpenAI API, or Gemini API
- **Hosting:** Clever Cloud (Java/Docker) or Scaleway

## 📁 Project Structure

```
EasyVocab/
├── index.html                          # Main application
├── .clever.json                        # Clever Cloud config
├── .gitignore                          # Git ignore rules
├── README.md                           # This file
└── vocabulary_learning_app_prototype_architecture_blueprint.html  # Original file (backup)
```

## 🌐 Browser Compatibility

- **Chrome/Edge:** Full support (Speech Recognition + TTS)
- **Safari (iOS/macOS):** TTS works, Speech Recognition may be limited
- **Firefox:** TTS works, Speech Recognition not supported

## 📝 Data Format

### Import/Export JSON Format
```json
[
  {
    "en": "boarding pass",
    "fr": "carte d'embarquement",
    "sentence": "Please present your boarding pass at gate 4."
  },
  {
    "en": "customs officer",
    "fr": "douanier",
    "sentence": "The customs officer checked my passport thoroughly."
  }
]
```

### CSV Format
```csv
boarding pass,carte d'embarquement,Please present your boarding pass at gate 4.
customs officer,douanier,The customs officer checked my passport thoroughly.
```

## 🚧 Roadmap

### Phase 1: Static Prototype ✅
- [x] Multi-list vocabulary management
- [x] Speech recognition and TTS
- [x] Printable worksheets
- [x] Listening exercises
- [x] Deploy to Clever Cloud

### Phase 2: Backend Integration (Planned)
- [ ] User authentication system
- [ ] Database persistence (PostgreSQL)
- [ ] REST API for vocabulary CRUD
- [ ] Advanced speech scoring (Azure/OpenAI)
- [ ] Progress tracking

### Phase 3: Advanced Features (Future)
- [ ] Mobile app (React Native or Flutter)
- [ ] Spaced repetition algorithm
- [ ] Gamification and achievements
- [ ] Social features (share lists, compete)
- [ ] Multi-language support (Spanish, German, etc.)

## 🤝 Contributing

This is currently a personal learning project. Backend integration contributions welcome once the architecture is finalized.

## 📄 License

MIT License - Feel free to use for educational purposes

## 🙏 Acknowledgments

- Web Speech API for browser-based speech features
- Tailwind CSS for rapid UI development
- Font Awesome for icons
- Clever Cloud for affordable French hosting

---

**Author:** Your Name  
**Last Updated:** September 2026  
**Status:** Static POC - Production ready for frontend, backend in planning
