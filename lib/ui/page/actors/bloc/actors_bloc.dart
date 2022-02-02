part of actors;

class ActorsBloc extends Cubit<List<Actor>?> {
  ActorsBloc() : super(null);

  final ActorsRepository _actorsRepo = ActorsRepository();
  final _authRepo = AuthRepository();

  final _navigationService = locator<NavigationService>();

  void onSelected(int val) {
    if (val == 0) {
      _navigationService.navigateToUsingPush(RosterScreen());
    } else {
      _authRepo.logoutUser();
    }
  }

  void getAllActors() {
    _actorsRepo.getAllActors().listen((event) {
      List<Actor> actors = List.from(event.docs.map((value) {
        return Actor.fromMap(value.data() as Map, value.id);
      }));
      emit(actors);
    });
  }

  void castActors(Actor actor) {
    _actorsRepo.addActorsToRoaster(actor);
  }

  void showDialogNewActor(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NewActor(
            onSubmit: (Actor actor) => _actorsRepo.addActors(actor));
      },
    );
  }
}
