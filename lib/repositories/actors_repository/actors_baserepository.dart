import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_casting_bloc/model/actors_model.dart';

abstract class ActorsBaseRepository {

  // Stream<List<T>> getAllActors();
  Stream<List<T>> listenToChanges(T);

  Future<void> addActors(Actor actor);

  Future<void> addActorsToRoaster(Actor actor);

  Future<void> removeActorsFromRoster(Actor actor);

  Stream<QuerySnapshot> getActorsFromRoster();
}
