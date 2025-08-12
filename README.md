# 🛸 Rick and Morty Challenge 🛸  

<div align="center">
  <img src="https://rickandmortyapi.com/api/character/avatar/1.jpeg" alt="Rick and Morty" width="200" />
</div>

> *"Wubba Lubba Dub Dub!"* — Rick Sanchez  
> Project developed with clean architecture and solid patterns, so the universe doesn't collapse... or almost.Rick and Morty Challenge 🛸  

> *"Wubba Lubba Dub Dub!"* — Rick Sanchez  
> Project developed with clean architecture and solid patterns, so the universe doesn’t collapse... or almost.  

---

## 📜 About the Project
The **Rick and Morty Challenge** is an app that consumes the [Rick and Morty API](https://rickandmortyapi.com/), displaying characters, locations, and episodes.  

This project is a technical challenge from Kobe's selection process, through which I was able to put into practice the knowledge of **Dart and Flutter** acquired in Kobe's workshop, as well as knowledge of **robust architecture, design patterns, and design systems** developed at college and the Apple Developer Academy.

The app was developed based on a **design created in Figma**, following the visual and UX/UI specifications proposed in the challenge.

Thus, the app represents the integrated application of academic and technical learning.

---

## 🏗 Architecture Used
This project follows the **Layered Architecture**, keeping responsibilities clearly defined:

📁 lib/  
├── 🎨 view/              # Presentation Layer  
├── 🧩 components/        # Reusable UI Components  
├── 📊 models/            # Data Models  
├── 🔄 repository/        # Contracts/Interfaces  
├── ⚙️ impl/              # Concrete Implementations  
├── 🎭 theme/             # Design System  
└── 🏗️ core/             # Global Dependencies  

---

## 🎯 Implemented Design Patterns

### 1️⃣ Repository Pattern
- **What it is:** Abstracts data access through interfaces.  
- **In this project:**  
  - Interfaces like `CharacterRepository`, `EpisodeRepository`, `LocationRepository`  
  - Concrete implementations in `impl/`  
- **Benefit:** Separation between business logic and data access. If tomorrow Rick wants to switch from REST API to GraphQL or another data dimension, just create a new implementation without affecting the rest of the code.  

---

### 2️⃣ Dependency Injection (Singleton)
- **What it is:** Manages dependencies centrally.  
- **In this project:**  
  - `AppDependencies` manages single instances (Singleton) of `Dio` and repositories.  
  - Base URL and timeouts configured in one place.  
- **Benefit:** Easier maintenance and testing, like Morty having a map of the multiverse.  

---

### 3️⃣ Factory Pattern
- **What it is:** Creates complex objects in a standardized way.  
- **In this project:**  
  - `fromMap()` methods in models for automatic JSON parsing.  
- **Benefit:** Avoids code repetition and keeps consistency.  

---

### 4️⃣ Widget Composition
- **What it is:** Builds UI with reusable components.  
- **In this project:**  
  - `CharacterCard`, `DetailedCharacterCard`, `SearchBarWidget`, `AppBarWidget`.  
- **Benefit:** Reuse and easy maintenance without reinventing the spaceship.  

---

## 📱 Features
- Character list with API data  
- Real-time character name search with customized empty state  
- Detail screen with complete information  
- Loading and API error handling  
- Responsive design and reusable components  

---

## ✅ Applied SOLID Principles
- **S**ingle Responsibility: each class has only one responsibility  
- **O**pen/Closed: open for extension, closed for modification  
- **L**iskov Substitution: implementations can replace abstractions without breaking  
- **I**nterface Segregation: specific interfaces per domain  
- **D**ependency Inversion: code depends on abstractions, not implementations  

---

## 📡 Technologies and Dependencies
- **Framework:** [Flutter](https://flutter.dev/) - Cross-platform development SDK  
- **Language:** [Dart](https://dart.dev/) - UI-optimized programming language  
- **HTTP Client:** [Dio v5.9.0](https://pub.dev/packages/dio)  
- **Fonts:** [Google Fonts v6.3.0](https://pub.dev/packages/google_fonts)  
- **HTTP Backup:** [http v1.2.0](https://pub.dev/packages/http) (additional dependency)  
- **Utility Collections:** [collection v1.18.0](https://pub.dev/packages/collection)  

### 🛠️ Development Tools
- **Widget Catalog:** [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets) - Official Flutter widget reference  
- **VS Code Extension:** [Dart Data Class Generator](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator) - Automatic generation of classes for JSON/Dart  

---

## 🚀 How to Run
```bash
# Clone the repository
git clone https://github.com/FeFeFarias05/kode-start.git

# Go to the project directory
cd kode-start/projects/workshop/rick_and_morty_challenge

# Install dependencies
flutter pub get

# Run the project
flutter run