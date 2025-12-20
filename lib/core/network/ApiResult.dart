import 'package:final_proj/core/network/AppException.dart';

abstract class ApiResult<T> {}

class Success<T> extends ApiResult
{
  T? data;
  Success({this.data});
}

class Failure extends ApiResult
{
  final AppException exception;

  Failure(this.exception);
}