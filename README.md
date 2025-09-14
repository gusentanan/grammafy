[![SonarQube Cloud](https://sonarcloud.io/images/project_badges/sonarcloud-light.svg)](https://sonarcloud.io/summary/new_code?id=gusentanan_grammafy)

# Grammafy
<table> <tr> <td> <img src="https://github.com/user-attachments/assets/c6930055-faa5-4034-9caa-639061fd8d16" height="150" align="left" style="margin-right: 16px;"> <p> This app was a byproduct of my long weekend. I kept using ChatGPT to correct grammar in my messages (working with foreigners does that), but I hated copy-pasting and sifting through replies. So I built Grammafy. <br/><br/> It uses Google Gemini to correct grammar, tone, and clarity—no need to switch apps. You can auto-paste from a template, submit it, and copy the fixed result instantly. <br/><br/> That’s all for now. </p> </td> </tr> </table>

<table>
  <tr>
     <td>Initial</td>
     <td>Response</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/fc16d8ee-4738-4c95-be14-d603fb919700" width=280 ></td>
    <td><img src="https://github.com/user-attachments/assets/f0a26321-a7a4-470c-a75b-1ecfd171a7b1" width=280 ></td>
  </tr>
</table>

## ✨ Features
- ✅ One-tap grammar & tone correction using Google Gemini
- 🎨 **Tone Selection**: Choose from Formal, Neutral, or Friendly correction styles
- 🔁 Smart input field with auto-paste from clipboard
- 📋 Copy corrected text instantly to clipboard
- 💬 Chat-like interface with typing animations
- 🔄 Refresh responses with different tones
- 🔒 Privacy-first: no local or external data logging
- 🏗️ Clean Architecture with dependency injection
- 🧪 Comprehensive testing suite (unit, widget, integration)

## More About
```
I haven't programmed this app to collect any personal information.

However, since you're using your own Gemini API key,  
all your prompts and responses are processed by your Google Cloud account.

On your device, no data is stored permanently.  
You can delete all local data by clearing the app’s storage or uninstalling it

```

## 🛠 Tech Stack

### Core Framework
- **Flutter** (Dart) - Cross-platform mobile development
- **Google Gemini GenAI** - AI-powered grammar correction

### Architecture & State Management
- **Clean Architecture** - Domain, Data, and Presentation layers
- **BLoC/Cubit** - State management with flutter_bloc
- **Dependency Injection** - get_it + injectable for IoC
- **Functional Programming** - fpdart for error handling with Either monad

### Code Generation & Tools
- **Freezed** - Immutable models and state unions
- **Auto Route** - Type-safe navigation
- **JSON Serialization** - Automated model serialization
- **Build Runner** - Code generation pipeline

### Testing & Quality
- **Patrol** - UI testing framework for integration tests
- **Mockito/Mocktail** - Mocking for unit tests
- **SonarCloud** - Code quality analysis and metrics
- **Flutter Test** - Unit and widget testing

## 🚀 Development & Setup

### Prerequisites
- Flutter SDK (>=3.3.0)
- Dart SDK
- Google Gemini API key

### Getting Started
1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Generate code: `flutter packages pub run build_runner build`
4. Set up your `.env` file with your Gemini API key
5. Run the app: `flutter run`

### Testing
```bash
# Run all tests
flutter test

# Run integration tests with Patrol
flutter test integration_test/
```

## 🧪 What's Next?
- ✅ ~~Tone/style selection (formal, casual, etc.)~~ **Implemented**
- Settings page with developer information
- Basic history & revision tracking
- Custom prompt presets
- Dark mode support
- Android & iOS release builds

## 📱 Architecture Overview

### Clean Architecture Layers
```
Presentation Layer (UI + State Management)
         ↓
Domain Layer (Business Logic + Interfaces)
         ↓
Data Layer (Repository + Network)
         ↓
External APIs (Google Gemini)
```

### State Flow
```
HomePageView → HomePageCubit → IGrammafyRepository → NetworkDataSource → Gemini API
```

### Key Components
- **HomePageCubit**: Manages UI state and business logic
- **GrammafyRepository**: Implements domain repository interface
- **NetworkDataSource**: Handles Gemini API communication
- **ToneType**: Enum for correction style selection

## 🤝 Contribution
Open to PRs, issues, and feedback. Feel free to fork or suggest improvements!

### Development Guidelines
- Follow Clean Architecture principles
- Use BLoC for state management
- Write comprehensive tests for new features
- Generate code with `build_runner` after model changes
- Maintain code quality with SonarCloud standards


