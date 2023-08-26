import 'package:dartz/dartz.dart';
import 'package:ecommerce_audio/core/errors/failure.dart';
import 'package:ecommerce_audio/core/utils/api_service.dart';

import '../../domain/repositories.dart';
import '../models/models.dart';

class HomeRepositoryImplement implements HomeRepository {
  HomeRepositoryImplement(this.apiService);

  final ApiService apiService;
  @override
  Future<Either<Failure, List<Models>>> fetchAllProduct() async {
    try {
      var data = await apiService.getBaseUrl(endPoint: "products");
      List<Models> products = [];
      for (var element in data) {
        products.add(Models.fromJson(element));
      }
      return right(products);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
