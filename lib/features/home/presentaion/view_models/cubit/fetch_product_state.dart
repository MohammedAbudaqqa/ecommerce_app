part of 'fetch_product_cubit.dart';

//sealed
abstract class FetchProductState extends Equatable {
  const FetchProductState();

  @override
  List<Object> get props => [];
}

final class FetchProductInitial extends FetchProductState {}

final class FetchProductLoading extends FetchProductState {}

final class FetchProductFauiler extends FetchProductState {
  final String errMessage;
  FetchProductFauiler(this.errMessage);
}

final class FetchProductSuccess extends FetchProductState {
  final List<Models> products;
  FetchProductSuccess(this.products);
}
