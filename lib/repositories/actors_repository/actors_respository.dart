import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_casting_bloc/model/actors_model.dart';
import 'package:movie_casting_bloc/repositories/actors_repository/actors_baserepository.dart';
import 'package:movie_casting_bloc/repositories/auth_repository/auth_repository.dart';
import 'package:movie_casting_bloc/util/logger.dart';

class ActorsRepository extends ActorsBaseRepository {
  final _fire = FirebaseFirestore.instance;
  final _authRepo = AuthRepository();

  String get userId {
    return _authRepo.fetchCurrentUser.uid;
  }

  @override
  Future<void> addActors(Actor actor) async {
    _fire.collection('actors').add(actor.toMap());
  }

  @override
  Future<void> addActorsToRoaster(Actor actor) async {
    logger.d(actor);
    _fire
        .collection('roster')
        .doc(userId)
        .collection('castedActors')
        .add(actor.toMap());
    _fire.collection('actors').doc(actor.id).delete();
  }

  @override
  Stream<QuerySnapshot> getActorsFromRoster() {
    return _fire
        .collection('roster')
        .doc(userId)
        .collection('castedActors')
        .orderBy("cost", descending: true)
        .snapshots();
    // if (snapshot.docs.isEmpty) {
    //   return [];
    // } else {
    //   List<Actor> actors = List.from(snapshot.docs.map((value) {
    //     return Actor.fromMap(value.data() as Map, value.id);
    //   }));
    //   return actors;
    // }
  }

  @override
  Stream<QuerySnapshot> getAllActors() {
    return _fire
        .collection('actors')
        .orderBy("cost", descending: true)
        .snapshots();
  }

  @override
  Future<void> removeActorsFromRoster(Actor actor) async {
    // TODO: implement removeActorsFromRoster
    await _fire
        .collection('roster')
        .doc(userId)
        .collection('castedActors')
        .doc(actor.id)
        .delete();
    await _fire.collection('actors').add(actor.toMap());
  }
}
