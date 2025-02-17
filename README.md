<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

A library that provides methods to filter lists, sets, and maps asynchronously.

## Getting started

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  async_filter: ^1.0.0
```

Afterward, import the package:

```dart
import 'package:async_filter/async_filter.dart';
```

## Usage

This package provides an `asyncFilter` method for lists, sets, and maps.
The method takes a predicate function that returns a `Future<bool>` and filters the collection asynchronously.

The predicate is executed for all elements in parallel.

**Example:**
```dart
final numbers = <int>[1, 2, 3, 5, 6, 7];
var result = await numbers.asyncFilter((x) async => x < 5); // (1, 2, 3)
result = await numbers.asyncFilter((x) async => x > 5); // (6, 7)
result = await numbers.asyncFilter((x) async => x.isEven); // (2, 6)
```
