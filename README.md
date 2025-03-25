flutter-getx-clean-arch
============================
> A basic example of a Flutter app using GetX for state management, Hive for a local database, and following a clean architecture.

### Top-level directory layout

    .
    ├── build                   # Compiled files
    ├── assets                  # Asset files (Images, Fonts, etc.)
    ├── android                 # android files
    ├── ios                     # ios files
    ├── lib                     # Source files
    ├── test                    # Automated tests
    ├── pubspec.yaml            # Dependencies specify other packages that your package needs in order to work
    └── README.md

### Project directory layout

The project directory follows a modular structure inspired by Clean Architecture principles and leverages GetX for state management within the presentation layer.

    ├── ...
    ├── lib                                # Source files
    │   ├── config                         # Config (Assets, Constants, Themes)
    │   ├── core                           # Core (Utils, Services, Extensions)
    │   └── features                       
    │       ├── todos                      # Todos Features
    │           ├── data                   # Data layer (Repositories, APIs, Database)
    │           ├── domain                 # Domain layer (Business logic, Entities, Use cases)
    │           └── presentation           # Presentation layer (UI, Widgets, ViewModels)
    │               ├── home               # Home layout
    │                   ├── controllers    # GetX controllers
    │                   ├── pages          # Screens or Pages
    │                   ├── widgets        # Reusable UI components
    │                   └── ...
    └── ...
    
### Unit tests directory

Unit tests are usually placed into the `test` or, less commonly, into the `tests` folder.

    ├── ...
    ├── test                   # Test files
    │   ├── core               # Core tests (Utils, Services, Lib)
    │   └── features           # Features tests
    └── ...
    
### Pre-commit command
```
dart run import_sorter:main bin lib test
dart fix --apply
flutter analyze

>> or command
dart run import_sorter:main bin lib test && dart fix --apply && flutter analyze
```
### Build model command by build_runner to @JsonSerializable
```
dart run build_runner build --delete-conflicting-outputs
```
