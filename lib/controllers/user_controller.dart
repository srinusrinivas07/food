// import 'package:food/data/repository/auth_repo.dart';
import 'package:food/data/repository/user_repo.dart';
import 'package:food/models/response_model.dart';
import 'package:food/models/user_model.dart';
// import 'package:food/models/signup_body_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({
    required this.userRepo,
  });

  bool _isLoading=false;
  late UserModel _userModel;
  bool get isLoading=>_isLoading;
  UserModel get userModel=>_userModel;

  Future<ResponseModel> getUserIfo() async {
    _isLoading=true;
    update();
    Response response=await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if(response.statusCode==200){
      _userModel=UserModel.fromJson(response.body);
      responseModel=ResponseModel(true, response.body["token"]);
    }else{
      responseModel=ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
}