import 'package:async_filter/async_filter.dart';
import 'package:test/test.dart';

void main() {
  group('List', () {
    test('basic test 1', () {
      final numbers = <int>[1, 2, 3, 5, 6, 7];
      var result = numbers.asyncFilter((x) async => x < 5);
      expect(result, completion([1, 2, 3]));
    });

    test('basic test 2', () {
      final numbers = <int>[1, 2, 3, 5, 6, 7];
      var result = numbers.asyncFilter((x) async => x > 5);
      expect(result, completion([6, 7]));
    });

    test('basic test 3', () {
      final numbers = <int>[1, 2, 3, 5, 6, 7];
      var result = numbers.asyncFilter((x) async => x.isEven);
      expect(result, completion([2, 6]));
    });
  });

  group('Set', () {
    test('basic test 1', () {
      final numbers = {1, 2, 3, 5, 6, 7};
      var result = numbers.asyncFilter((x) async => x < 5);
      expect(result, completion({1, 2, 3}));
    });

    test('basic test 2', () {
      final numbers = {1, 2, 3, 5, 6, 7};
      var result = numbers.asyncFilter((x) async => x > 5);
      expect(result, completion({6, 7}));
    });

    test('basic test 3', () {
      final numbers = {1, 2, 3, 5, 6, 7};
      var result = numbers.asyncFilter((x) async => x.isEven);
      expect(result, completion({2, 6}));
    });
  });

  group('Map', () {
    test('basic test 1', () {
      final numbers = {1: 1, 2: 2, 3: 3, 5: 5, 6: 6, 7: 7};
      var result = numbers.asyncFilter((x) async => x.key < 5);
      expect(result, completion({1: 1, 2: 2, 3: 3}));
    });

    test('basic test 2', () {
      final numbers = {1: 1, 2: 2, 3: 3, 5: 5, 6: 6, 7: 7};
      var result = numbers.asyncFilter((x) async => x.key > 5);
      expect(result, completion({6: 6, 7: 7}));
    });

    test('basic test 3', () {
      final numbers = {1: 1, 2: 2, 3: 3, 5: 5, 6: 6, 7: 7};
      var result = numbers.asyncFilter((x) async => x.key.isEven);
      expect(result, completion({2: 2, 6: 6}));
    });
  });
}
