# trilhaapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Adicionar os pacotes em pubspec.yaml
# Em dependencies:
  cupertino_icons: ^1.0.2
  google_fonts: ^5.1.0
  shared_preferences: ^2.2.0
  hive: ^2.2.3
  path_provider: ^2.1.0

# Em dev_dependencies:
hive_generator: ^2.0.1
build_runner: ^2.4.6

# Após adicionar as dev_depenencies rodar no terminal
flutter pub run build_runner build
