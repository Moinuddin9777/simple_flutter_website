import 'package:simple_flutter_website/bloc/photos/photos_state.dart';
import 'package:simple_flutter_website/models/products_response.dart';
import 'package:simple_flutter_website/products/products_event.dart';
import 'package:simple_flutter_website/products/products_state.dart';
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

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<LoadProductsEvent>(getProducts);
  }
  Future<void> getProducts(
      LoadProductsEvent event, Emitter<ProductsState> emit) async {
    List<ProductsResponse> products = [];
    //emit(ProductsLoadingState());
    try {
      if (state is ProductsLoadedState) {
        products = [...(state as ProductsLoadedState).products];
      }
      bool hasNext = true;
      var productsResponse = await ProductsFetching.fetchProducts(products.length);
      if (productsResponse.length < 10) {
        hasNext = false;
      }
      products.addAll(productsResponse);
      emit(
        ProductsLoadedState(products, hasNext),
      );
    } catch (err) {
      emit(ProductsErrorState(err.toString()));
    }
  }
}
