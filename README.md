1️⃣ Install Flutter
Make sure you have Flutter installed. If not, download and install it from flutter.dev.


2️⃣ Clone the Repository
Copy and paste this into your terminal:

git clone https://github.com/UmaiZ/anime-quote.git
cd anime-quotes-app


3️⃣ Install Dependencies
Run the following command inside the project folder:

flutter pub get


4️⃣ Run the App
To start the app on your emulator or connected device, use:

flutter run
If you want to run it on a specific platform:

flutter run -d android
flutter run -d ios
📂 Project Structure

animechan/  
│── lib/  
│   ├── main.dart  
│   ├── view/  
│   │   ├── get_started.dart  
│   │   ├── anime_quote_screen.dart  
│   ├── viewmodel/  
│   │   ├── anime_viewmodel.dart  
│   ├── model/  
│   │   ├── anime_quote.dart  
│   ├── helper/  
│   │   ├── network.dart  
│── pubspec.yaml  
│── README.md  
🔧 API Configuration

This app fetches quotes from an API. You can find the API URLs inside:

📌 lib/helper/network.dart

class ApiUrls {
  static const String baseUrl = 'https://urcardm5c3.execute-api.us-west-1.amazonaws.com/dev';
  String fetchAnime = "$baseUrl/fetch-anime";
}

## 🎥 App Preview

![App Demo](assets/images/preview.mov)
🚀 Happy Coding! 🎉