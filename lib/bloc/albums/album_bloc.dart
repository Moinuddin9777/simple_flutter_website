import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_website/bloc/albums/album_event.dart';
import 'package:simple_flutter_website/bloc/albums/album_state.dart';
import 'package:simple_flutter_website/models/album_model.dart';
import 'package:simple_flutter_website/services/api_services.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumLoadingState()) {
    on<LoadAlbumEvent>(getAlbum);
  }
  Future<void> getAlbum(LoadAlbumEvent event, Emitter<AlbumState> emit) async {
    List<AlbumResponse> album = [];
    //emit(AlbumLoadingState());
    try {
      if (state is AlbumLoadedState) {
        album = [...(state as AlbumLoadedState).album];
      }
      bool hasNext = true;
      var albumResponse = await AlbumFetching.fetchAlbum(album.length);
      if (albumResponse.length < 10) {
        hasNext = false;
      }
      album.addAll(albumResponse);
      emit(
        AlbumLoadedState(album, hasNext),
      );
    } catch (err) {
      emit(AlbumErrorState(err.toString()));
    }
  }
}
