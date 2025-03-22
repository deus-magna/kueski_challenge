import 'package:kueski_challenge/domain/error/error.dart';
import 'package:oxidized/oxidized.dart';

abstract class MoviesRepo {
  /// get popular movies
  Future<Result<Unit, Failure>> getPopular({required int page});
}
