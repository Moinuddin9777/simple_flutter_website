// here we are building mainly three states
// loading state
// loaded state
// error state
import 'package:equatable/equatable.dart';
//import 'package:simple_flutter_website/models/api_response.dart';
import 'package:simple_flutter_website/models/photos_response.dart';
import 'package:simple_flutter_website/models/products_response.dart';

abstract class ProductsState extends Equatable {}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsLoadedState extends ProductsState {
  List<ProductsResponse> products = [];
  final bool hasNext;

  ProductsLoadedState(this.products, this.hasNext);

  @override
  List<Object?> get props => [products];
}

class ProductsErrorState extends ProductsState {
  final String error;

  ProductsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
