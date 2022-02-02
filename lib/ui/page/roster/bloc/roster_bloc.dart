part of roster;

class RosterBloc extends Cubit<List<Actor>?> {
  RosterBloc() : super(null);
  final _authRepo = AuthRepository();
  final _actorRepo = ActorsRepository();
  final _navigationService = locator<NavigationService>();
  int _totalCost = 0;
  final formatCurrency = NumberFormat.simpleCurrency();

  int get totalCost {
    return _totalCost;
  }

  String get formattedCost {
    return formatCurrency.format(totalCost);
  }

  void onSelected(int val) {
    if (val == 0) {
      _navigationService.popPage();
      state!.clear();
      _totalCost = 0;
      emit(state);
    } else {
      _authRepo.logoutUser();
    }
  }

  void getCastedActors() async {
    _actorRepo.getActorsFromRoster().listen((event) {
      List<Actor> actors = List.from(event.docs.map((value) {
        return Actor.fromMap(value.data() as Map, value.id);
      }));
      _totalCost = 0;
      emit(actors);
      calculateTotal();
    });
  }

  void removeCastedActors(Actor actor) async {
    await _actorRepo.removeActorsFromRoster(actor);
  }

  void calculateTotal() {
    state!.forEach((element) {
      _totalCost += element.cost;
    });
  }
}
