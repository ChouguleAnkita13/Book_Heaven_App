# Book Heaven - A Flutter Bookstore App

## Overview
Book Heaven is a Flutter-based mobile application designed for book enthusiasts to explore, purchase, and manage their book collections. The app uses the BLoC state management pattern for efficient data handling and integrates Firebase Authentication for user authentication. The app ensures a smooth and intuitive user experience with a well-structured architecture following the Model-View-Controller (MVC) pattern.


## Project Structure

The project follows the MVC (Model-View-Controller) architecture for better organization and scalability.

```bash
📂 book_heaven_app
│── 📂 lib
│   │── 📂 controller   # Business logic layer using BLoC
│   │   │── 📂 CartBloc   # Manages cart-related actions
│   │   │── 📂 Data       # Handles API calls and data processing
│   │   │── 📂 FirebaseData  # Firebase authentication and database interactions
│   │   │── 📂 HomeBloc   # Manages home screen logic
│   │   │── 📂 LoginRegisterBloc  # Handles login and registration actions
│   │   │── 📂 NavbarBloc  # Controls bottom navigation bar state
│   │   │── 📂 SharedPrefernceData  # Manages user session data
│   │
│   │── 📂 model  # Data models
│   │   │── author_model.dart  # Author-related data model
│   │   │── book_model.dart  # Book-related data model
│   │
│   │── 📂 view  # UI layer (Screens & Widgets)
│   │   │── 📂 CartScreen
│   │   │   │── 📂 Widgets  # Reusable widgets for CartScreen
│   │   │   │── cart_screen.dart  # Cart page UI
│   │   │── 📂 HomeScreen
│   │   │   │── 📂 Widgets  # Reusable widgets for HomeScreen
│   │   │   │── home_screen.dart  # Home page UI
│   │   │── 📂 LoginRegisterScreen
│   │   │   │── 📂 Widgets  # Reusable widgets for Login & Register Screens
│   │   │   │── login_screen.dart  # Login UI
│   │   │   │── register_screen.dart  # Registration UI
│   │   │── 📂 Widgets  # Common UI components
│   │   │── navbar_screen.dart  # Bottom navigation bar
│   │   │── onboard_screen.dart  # Onboarding UI
│   │   │── splash_screen.dart  # Splash screen UI
│   │
│   │── main.dart  # App entry point                    
                   
```
## Key Features

#### Book Management
Browse through a curated list of books
View book details, including author, price, and description
Add/remove books from the wishlist

####  Cart Functionality
Add books to the cart
Update book quantity in the cart
Remove books from the cart

#### User Authentication
Firebase Authentication for secure login and registration
Email & password-based authentication

#### Session Management
Integrated SharedPreferences for managing user sessions (isLogin variable), ensuring persistence between app restarts.

#### State Management
Efficient and reactive updates using the Bloc package.
Seamless interaction and performance across app features.

#### Navigation
Easy navigation between screens, including Login, Signup, Home, CartScreen, and Details screens.
Intuitive back and forward transitions for better user flow.


## Flutter Version
```
flutter --version
  Flutter 3.27.4
  Dart 3.6.2
```

## Dependencies
```bash
dependencies:
  bloc: ^9.0.0
  cloud_firestore: ^5.6.3
  firebase_auth: ^5.4.2
  firebase_core: ^3.11.0
  flutter:
    sdk: flutter
  flutter_bloc: ^9.0.0
  google_fonts: ^6.2.1
  shared_preferences: ^2.3.3

```
## License
This project is licensed under the MIT License. See the [LICENSE](https://choosealicense.com/licenses/mit/) file for more details.

