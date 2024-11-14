# POS Flutter Application

A Flutter POS (Point of Sale) application featuring a clean and user-friendly design with navigation between dashboard, profile, cart, and settings pages.

## Features

- Custom navigation bar with four main pages: Dashboard, Profile, Cart, and Settings.
- Integrates Google Fonts for custom typography.
- Uses Iconsax for modern icons.
- Organized project structure for scalability and maintainability.

## Screenshots

| onboarding/ splash Screen                        | login Page                              |
|--------------------------------------------------|-----------------------------------------|
| ![Onboarding](assets/screenshots/onboarding.png) | ![Login](assets/screenshots/loginn.png) |

| HomePage                                     | cart                                 |
|----------------------------------------------|--------------------------------------|
| ![Homepage](assets/screenshots/homepage.png) | ![Cart](assets/screenshots/cart.png) |

| cart2                                  |
|----------------------------------------|
| ![Cart2](assets/screenshots/cart2.png) |

> **Note:** Please add your screenshots in the `screenshots` directory to display them in this README.

## Dependencies

This project uses the following Flutter packages:

- **google_fonts: ^6.2.1** - Allows you to easily use Google Fonts.
- **get: ^4.6.6** - Provides a powerful and lightweight state management solution.
- **iconsax: ^0.0.8** - A modern icon set with over 2000 unique icons.

To install these dependencies, add them to your `pubspec.yaml` file and run `flutter pub get`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  get: ^4.6.6
  iconsax: ^0.0.8
