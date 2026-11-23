# MyPortfolio Mobile - Arsya Khairunissa Budiman

| Information | Details |
|---|---|
| **Name** | Arsya Khairunissa Budiman |
| **NPM** | 2506544076 |
| **Class** | Pemrograman Berbasis Platform (PBP) E |
| **Faculty** | Faculty of Computer Science, Universitas Indonesia |
| **Lecturer** | Daya Adianto, S.Kom., M.Kom. |

## About the Project

MyPortfolio Mobile is the mobile extension of my personal portfolio. It is built with Flutter and continues directly from the code of Tutorial 08. The web version of this portfolio (Django, HTML5, and CSS3) lives in a separate repository: [syakhrnss/myportofolio](https://github.com/syakhrnss/myportofolio). This repository only contains the Flutter app, and its look follows the web portfolio's dark navy theme with purple and pink accents.

## Weekly Progress

| Week | Progress |
|---|---|
| 8 | Continued the `myportofolio_mobile` project from Tutorial 08, with `menu.dart` separated from `main.dart` and `MyHomePage` as a `StatelessWidget`. Replaced the sample data with my own identity in the three `InfoCard`s. Added a `color` attribute to the `ItemHomepage` model so every `ItemCard` has a unique background color without repeated conditionals. Added a styled `SnackBar`, a scrollable body, `const` constructors, docstrings, a dark navy theme based on the web portfolio, and navigable section pages as extra features. |
| 9 | Continued the `myportofolio_mobile` project from Tutorial 09 by adding an Add Education form (`education_form.dart`) and a `LeftDrawer` for navigation. The form uses `Form` with `GlobalKey<FormState>`, `TextFormField`, `DropdownButtonFormField`, and `showDatePicker()`. Moved validation rules into `lib/utils/validators.dart`, and added an "ongoing" `SwitchListTile` that disables the end date field. The form is wrapped in a `SingleChildScrollView`, shows a summary `AlertDialog` after a valid submit, and keeps the same theme as the rest of the app.|

## Documentation & AI Disclosure + Reflective Questions

| No. | Assignment | Answer |
|---|---|---|
| 7 | Basic Flutter | [Tugas7.md](/reflection/TUGAS7.md) |
| 8 | Flutter Navigation, Layouts, Forms, and Input Elements | [Tugas7.md](/reflection/TUGAS8.md) |


## Setup and Running Locally

### Requirements

- Flutter SDK (a recent stable version; this project uses current Dart syntax)
- Google Chrome, or an Android emulator or device
- Git

Run `flutter doctor` to check your setup. Chrome is enough to run this project, and the Android toolchain is optional.

### Run the App

Clone this repository:
```bash
git clone <repository-url>
cd myportofolio_mobile
```

Install dependencies, analyze the code, and run:
```bash
flutter pub get
flutter analyze
flutter run -d chrome
```

While the app is running, press `r` in the terminal for hot reload, or `R` for hot restart (needed after changing static data such as the `items` list or the theme).

## Git Workflow

Work is split into feature branches and small commits written in the conventional commit style, for example:

```
feat: add color attribute to ItemHomepage model
refactor: use const constructors and static const data
fix: prevent layout overflow with scrollable body
docs: add docstrings and remove boilerplate comments
```

Each feature branch is merged into `main` through a pull request.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
