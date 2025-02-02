# Calendar DateTime Extension

[![Calendar DateTime Extension CI](https://github.com/themobilecoder/calendar_datetime_extension/actions/workflows/dart.yml/badge.svg)](https://github.com/themobilecoder/calendar_datetime_extension/actions/workflows/dart.yml)

calendar_datetime_extension is a Dart library that provides extension functions for `DateTime` objects, utilizing the power of the Jiffy library under the hood.

## Features

- Simplified date and time for dates such as weekends and weekdays
- Easy-to-use extension methods
- Leverages Jiffy for robust date and time handling

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  calendar_datetime_extension: ^1.0.1
```

## Usage

Import the library and start using the extension methods:

```dart
import 'package:calendar_datetime_extension/calendar_datetime_extension.dart';

void main() {
  DateTime date = DateTime(2023, 1, 3); // 3rd January 2023
  DateTime nextWeekday = date.getNextWeekday();
  print('The next weekday after $date is $nextWeekday'); // Wednesday
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Acknowledgements

- [Jiffy](https://pub.dev/packages/jiffy) - A powerful date and time manipulation library for Dart
