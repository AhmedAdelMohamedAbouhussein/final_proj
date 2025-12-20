import 'package:final_proj/core/network/ApiConstants.dart';
import 'package:final_proj/core/network/ApiResult.dart';
import 'package:final_proj/core/network/AppException.dart';
import 'package:final_proj/features/auth/data/model/LoginResponseModel.dart';
import 'package:dio/dio.dart';

class AuthService
{
  final Dio dio;
  AuthService(this.dio);

  Future<ApiResult> login(String username, String password) async
  {
    try
    {
      Response response = await dio.post(
        ApiConstants.loginEndPoint,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200)
      {
        Map<String, dynamic> data = response.data;
        return Success<LoginResponseModel>(
          data: LoginResponseModel.fromJson(data),
        );
      }
      else
      {
        return Failure(
          AppException(
            errorMessage: response.statusMessage ?? 'Invalid Response',
            errorCode: response.statusCode,
          ),
        );
      }
    }
    on DioException catch (e)
    {
      return Failure(AppException.fromDioException(e));
    }
    catch (e)
    {
      return Failure(AppException(errorMessage: e.toString()));
    }
  }
}