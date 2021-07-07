library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movies_redux/src/models/serializers.dart';
import 'movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState() {
    return _$AppState((AppStateBuilder b) {
      b
        ..isLoading = false
        ..page = 1;
    });
  }

  factory AppState.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json)!;
  }

  AppState._();

  BuiltList<Movie> get movies;

  int get page;

  bool get isLoading;

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
