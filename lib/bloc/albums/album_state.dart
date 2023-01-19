// here we are building mainly three states
// loading state
// loaded state
// error state

import 'package:equatable/equatable.dart';
import 'package:simple_flutter_website/models/album_model.dart';

abstract class AlbumState extends Equatable {}

class AlbumLoadingState extends AlbumState {
  @override
  List<Object?> get props => [];
}

class AlbumLoadedState extends AlbumState {
  List<AlbumResponse> album = [];
  final bool hasNext;

  AlbumLoadedState(this.album, this.hasNext);

  @override
  List<Object?> get props => [album];
}

class AlbumErrorState extends AlbumState {
  final String error;

  AlbumErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
