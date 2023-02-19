import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/hot_and_new_res/model/hot_and_new_res.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewRes>> getHotAndNewMovieData();
    Future<Either<MainFailure, HotAndNewRes>> getHotAndNewTvData();

}
