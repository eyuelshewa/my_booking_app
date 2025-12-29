# GEMINI.md

## Project Overview

This is a Flutter-based mobile application for a booking system. The project is named "my_booking_app" and appears to be in its early stages of development.

The application uses Firebase for its backend, including:
*   **Firebase Auth:** For user authentication.
*   **Cloud Firestore:** As a NoSQL database for storing data.
*   **Firebase Analytics:** For usage analytics.

For local storage, the application uses `sqflite`. State management is handled by `bloc`.

The UI includes a login screen with options for email/password, Facebook, and Instagram authentication. The login screen also features some animations.

## Building and Running

### Prerequisites

*   Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
*   A configured IDE such as Android Studio or VS Code.
*   For Firebase integration, you will need to set up a Firebase project and add the necessary configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) to the project.

### Commands

*   **Install dependencies:**
    ```bash
    flutter pub get
    ```

*   **Run the app:**
    ```bash
    flutter run
    ```

*   **Run tests:**
    ```bash
    flutter test
    ```

## Development Conventions

*   **State Management:** The project uses the BLoC (Business Logic Component) pattern for state management.
*   **File Structure:** The project follows the standard Flutter project structure. UI-related files are located in the `lib/views` directory, and animations in `lib/animation`.
*   **Code Style:** The project uses the `flutter_lints` package to enforce good coding practices. The linting rules are defined in the `analysis_options.yaml` file.
*   **Dependencies:** Project dependencies are managed in the `pubspec.yaml` file.
