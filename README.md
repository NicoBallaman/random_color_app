## Prerequisites
- Flutter 3.24.0
- Dart 3.5.0

## Installation

1. Clone this repository: 
    `https://github.com/NicoBallaman/random_color_app.git`
2. Navigate to the project directory:
    `cd random_color_app`
3. Install dependencies:
    `flutter pub get`


## Architecture

The project is organized into modules, each representing a distinct functional area of the application designed to be scalable, maintainable, and testable. This approach promotes modularity and separation of concerns.

Structure:
<br>
application/
<br>
├── localization/
<br>
├── theme
<br>
└── application.dart
<br>
core/
<br>
├── abstraction/
<br>
└── integrations/
<br>
modules/
<br>
└── home_module/
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── data/
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── domain/
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── presentation/
<br>
└── main.dart

Each module contains:
- `data`:  data sources
- `domain`: Use cases, repositories definitions and entity models
- `presentation`: Pages BLoC and widgets specific to the feature
- `_module.dart`:  file with di of the module and navigation

## Main Libraries

- `flutter_bloc`: For state management and separation of business logic from the UI
- `get_it`: For dependency injection
- `mockito`: For creating mock objects in unit tests
- `bloc_test`: For testing BLoC classes

## Testing

Each module contains unit test for bloc and repositories. To run unit tests:
1. `flutter test`