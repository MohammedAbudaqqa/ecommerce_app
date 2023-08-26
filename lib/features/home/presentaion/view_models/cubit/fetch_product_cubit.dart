import 'package:bloc/bloc.dart';
import 'package:ecommerce_audio/data/models/models.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  FetchProductCubit(this.repository) : super(FetchProductInitial());
  final HomeRepository repository;
  // late List products;
  // List fetchAllProduct() {
  //   emit(FetchProductLoading());
  //   repository.fetchAllProduct().then((value) {
  //     value.fold((l) {
  //       emit(FetchProductFauiler(l.errMessage));
  //     }, (r) {
  //       this.products = r;
  //       emit(FetchProductSuccess(r));
  //     });
  //   });
  //   return products;
  // }
  Future<void> fetchAllProduct() async {
    emit(FetchProductLoading());
    var result = await repository.fetchAllProduct();
    print(result);
    print("=================================from cubit");

    result.fold((l) {
      emit(
        FetchProductFauiler(l.errMessage),
      );
    }, (r) {
      emit(FetchProductSuccess(r));
    });
  }
}
