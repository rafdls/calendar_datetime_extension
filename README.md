# Date Time Extensions

[![Date Time Extensions CI](https://github.com/themobilecoder/date_time_extensions/actions/workflows/dart.yml/badge.svg)](https://github.com/themobilecoder/date_time_extensions/actions/workflows/dart.yml)

Date Time Extensions is a Dart library that provides extension functions for `DateTime` objects, utilizing the power of the Jiffy library under the hood.

## Features

- Simplified date and time manipulation
- Easy-to-use extension methods
- Leverages Jiffy for robust date and time handling

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  date_time_extensions: ^1.0.0
```

## Usage

Import the library and start using the extension methods:

```dart
import 'package:date_time_extensions/date_time_extensions.dart';

void main() {
    DateTime now = DateTime.now();

    // Example usage of an extension method
    DateTime nextWeek = now.addWeeks(1);
    print(nextWeek);
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Acknowledgements

- [Jiffy](https://pub.dev/packages/jiffy) - A powerful date and time manipulation library for Dart
