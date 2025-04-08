# 📱 WordPair Generator App

This is a Flutter application that generates random word pairs in English or Portuguese. Users can like their favorite pairs and view them in a dedicated favorites page. The app features a language setting to switch between English and Portuguese word generation, along with a responsive design and side navigation layout optimized for both mobile and larger screens (tablet/web).

## 🚀 Features

- 🔀 Generate random word pairs
- ❤️ Mark/unmark word pairs as favorites
- 📂 View your list of favorite word pairs
- 🌐 Choose between English and Portuguese word generation
- 📱 Responsive layout with `NavigationRail` on larger screens
- 🎨 Theming based on device mode
- ✅ Accessibility-friendly with semantics support

## 📂 Project Structure

```
lib/
├── main.dart                # Entry point
├── app_state.dart           # App-level state with Provider
├── helpers/                 # Helper classes (e.g., device info)
├── pages/                   # Screens like HomePage,FavoritesPage
├── widgets/                 # Reusable UI components (e.g., BigCard, CustomButton)
```

## 🧠 State Management

We use `Provider` to handle state throughout the app via `MyAppState`.

- `current`: the current word pair
- `favorites`: list of favorited word pairs
- `language`: selected language (`LanguageOption.english` or `LanguageOption.portuguese`)

## 🌐 Language Support

The app now supports:

- English (default, using `english_words` package)
- Portuguese (random word combinations from a predefined list of Brazilian states)

You can change the language in the **Settings** screen.

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo
```

### 2. Get dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

## 🧪 Running Tests

```bash
flutter test
```

## 📚 Learn more about Flutter

- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)

## 👨‍💻 Author

Created by Lucas Hellanio — inspired by Flutter codelabs and personal learning.
