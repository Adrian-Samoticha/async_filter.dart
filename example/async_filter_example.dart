import 'package:async_filter/async_filter.dart';

Future<void> showcaseListFiltering() async {
  print('List filtering:');
  final numbers = <int>[1, 2, 3, 5, 6, 7];
  var result = await numbers.asyncFilter((x) async => x < 5);
  print(result); // [1, 2, 3]
  result = await numbers.asyncFilter((x) async => x > 5);
  print(result); // [6, 7]
  result = await numbers.asyncFilter((x) async => x.isEven);
  print(result); // [2, 6]
}

Future<void> showcaseSetFiltering() async {
  print('Set filtering:');
  final numbers = {1, 2, 3, 5, 6, 7};
  var result = await numbers.asyncFilter((x) async => x < 5);
  print(result); // {1, 2, 3}
  result = await numbers.asyncFilter((x) async => x > 5);
  print(result); // {6, 7}
  result = await numbers.asyncFilter((x) async => x.isEven);
  print(result); // {2, 6}
}

Future<void> showcaseMapFiltering() async {
  print('Map filtering:');
  final numbers = {1: 1, 2: 2, 3: 3, 5: 5, 6: 6, 7: 7};
  var result = await numbers.asyncFilter((x) async => x.key < 5);
  print(result); // {1: 1, 2: 2, 3: 3}
  result = await numbers.asyncFilter((x) async => x.key > 5);
  print(result); // {6: 6, 7: 7}
  result = await numbers.asyncFilter((x) async => x.key.isEven);
  print(result); // {2: 2, 6: 6}
}

Future<void> showcaseParallelFiltering() async {
  print('Parallel filtering:');
  final numbers = <int>[1, 2, 3, 5, 6, 7];
  var result = await numbers.asyncFilter((x) async {
    // Since the predicate is execute for all elements in parallel,
    // the total delay is one second (rather than six seconds).
    await Future.delayed(Duration(milliseconds: 1000));
    return x < 5;
  });
  print(result); // [1, 2, 3]
}

Future<void> main() async {
  await showcaseListFiltering();
  await showcaseSetFiltering();
  await showcaseMapFiltering();
  await showcaseParallelFiltering();
}
