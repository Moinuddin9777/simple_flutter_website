
import 'package:simple_flutter_website/models/api_response.dart';
import 'package:simple_flutter_website/photos/photos_event.dart';
import 'package:simple_flutter_website/photos/photos_state.dart';
import 'package:simple_flutter_website/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
//////////////////////////////////
/// HERE IS OUR CORE ////////////
/// The middle man "Bloc"///////
///////////////////////////////
/// acts like a controller ///
/// interms of GetX /////////
////////////////////////////

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosLoadingState()) {
    on<LoadPhotosEvent>(getPhotos);
  }
  Future<void> getPhotos(
      LoadPhotosEvent event, Emitter<PhotosState> emit) async {
    List<PhotosResponse> photos = [];
    //emit(PhotosLoadingState());
    try {
      if (state is PhotosLoadedState) {
        photos = [...(state as PhotosLoadedState).photos];
      }
      bool hasNext = true;
      var photosResponse = await PhotosFetching.fetchPhotos(photos.length);
      if (photosResponse.length < 10) {
        hasNext = false;
      }
      photos.addAll(photosResponse);
      emit(
        PhotosLoadedState(photos, hasNext),
      );
    } catch (err) {
      emit(PhotosErrorState(err.toString()));
    }
  }
}
