# 🎬 Cinema Wisdom

🌍 Available in: [Español](README.es.md)

Cinema Wisdom is a Flutter application that provides users with detailed movie information, including data sourced from The Movie Database (TMDB). The app allows users to explore movies, get specific details, and manage personal preferences.

## 📱 Internal Testing on Google Play

Cinema Wisdom is available for internal testing via **Google Play Console**.  
If you would like to try the app before its official release, please send me an email with your Google account so I can add you to the tester list.

📩 **Contact Email**: [Here!](mailto:antoniojimenezinfante@gmail.com?subject=Join%20Cinema%20Wisdom%20internal%20testing&body=I%20would%20like%20to%20join%20the%20Cinema%20Wisdom%20internal%20test.%20Here%20is%20my%20Google%20account%20email:%0A%0A%5Binsert%20here%20the%20Google%20account%20email%20you%20use%20on%20the%20Play%20Store%5D)


## 🚀 Main Features

- **Movie Exploration**: Browse through a wide selection of movies available in the TMDB database.
- **Movie Details**: Access detailed information about each movie, including synopsis, cast, and more.
- **Favorites Management**: Save your favorite movies for quick access in the future.
- **Advanced Search**: Use filters and search criteria to find movies that match your interests.

## 🛠️ System Requirements

- **Flutter**: Ensure you have the latest version of Flutter installed. You can check your current version by running:

  ```bash
  flutter --version
  ```

- **Dependencies**: The project's dependencies are listed in the `pubspec.yaml` file. Make sure to install all required dependencies before running the application.

## 📦 Installation

1. **Clone the repository** to your local machine:

   ```bash
   git clone https://github.com/antjiminf/cinema_wisdom.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd cinema_wisdom
   ```

3. **Set up environment variables**:
   - Rename `.env.template` to `.env`.
   - Update the `.env` file with your own API keys and configurations, especially the TMDB key.

4. **Install dependencies**:

   ```bash
   flutter pub get
   ```

5. **Generate necessary code**:
   - After modifying any entity in the domain layer, run:

   ```bash 
   flutter pub run build_runner build
   ```

## 🚀 Running in Development Mode

To run the application in development mode:

1. **Start the application**:

   ```bash 
   flutter run
   ```
   This will launch the app on the connected device or emulator.