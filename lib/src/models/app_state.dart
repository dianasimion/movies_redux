part of models;

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
