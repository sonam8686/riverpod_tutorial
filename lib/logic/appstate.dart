class AppState {
  final int number;
  final String? name;
  final bool? isMarried;

  const AppState({
    this.name,
    this.isMarried,
    int? number,
  }) : number = number ?? 0;
  int get numbers => number;

  AppState copyWith({int? number, String? newName, bool? married}) => AppState(
        name: newName ?? name,
        isMarried: married ?? isMarried,
        number: number ?? this.number,
      );

  AppState add(int number) => copyWith(number: number + this.number);

  AppState incremnt() => copyWith(number: number + 1);
  AppState dencremnt() => copyWith(number: number - 1);

  @override
  String toString() => number.toString();
}
