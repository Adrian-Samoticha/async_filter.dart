extension AsyncListFilterExtension<E> on List<E> {
  /// Returns a [List] containing all elements that satisfy the asynchronous
  /// [predicate].
  ///
  /// The matching elements have the same order as they do in this [List].
  /// The predicate is executed for all elements in parallel.
  ///
  /// Example:
  /// ```dart
  /// final numbers = <int>[1, 2, 3, 5, 6, 7];
  /// var result = await numbers.asyncFilter((x) async => x < 5); // (1, 2, 3)
  /// result = await numbers.asyncFilter((x) async => x > 5); // (6, 7)
  /// result = await numbers.asyncFilter((x) async => x.isEven); // (2, 6)
  /// ```
  Future<List<E>> asyncFilter(
    Future<bool> Function(E element) predicate,
  ) async {
    var result = <E>[];

    var futures = map(predicate).toList();

    for (var i = 0; i < length; i += 1) {
      final futureResult = await futures[i];
      if (futureResult) {
        result.add(this[i]);
      }
    }

    return result;
  }
}

/// Returns a [Set] containing all elements that satisfy the asynchronous
/// [predicate].
///
/// The matching elements have the same order as they do in this [Set].
/// The predicate is executed for all elements in parallel.
extension AsyncSetFilterExtension<E> on Set<E> {
  Future<Set<E>> asyncFilter(
    Future<bool> Function(E element) predicate,
  ) async {
    return (await toList().asyncFilter(predicate)).toSet();
  }
}

/// Returns a [Map] containing all entries that satisfy the asynchronous
/// [predicate].
///
/// The matching entries have the same order as they do in this [Map].
/// The predicate is executed for all entries in parallel.
extension AsyncMapFilterExtension<K, V> on Map<K, V> {
  Future<Map<K, V>> asyncFilter(
    Future<bool> Function(MapEntry<K, V> entry) predicate,
  ) async {
    return Map.fromEntries(await entries.toList().asyncFilter(predicate));
  }
}
