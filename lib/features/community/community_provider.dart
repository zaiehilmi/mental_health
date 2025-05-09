import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterListProvider = Provider(
  (ref) => [
    'labels.hub_filter.all',
    'labels.hub_filter.relationship',
    'labels.hub_filter.self_care',
    'labels.hub_filter.fitness',
    'labels.hub_filter.mindfulness',
  ],
);
