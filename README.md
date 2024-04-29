# flutter-getx-clean-arch
A basic example of a Flutter app using GetX for state management, Hive for a local database, and following a clean architecture.

### Pre-commit command
```
dart run import_sorter:main bin lib test
dart fix --apply
flutter analyze
```

#### or command
```
dart run import_sorter:main bin lib test && dart fix --apply && flutter analyze
```

### Build model command by build_runner to @JsonSerializable
```
dart run build_runner build --delete-conflicting-outputs
```
