import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {

    // var verified = await authRepository.instance.verifyOTP(otp);

    // verified ? Get.offAll(const Dashboard()) : Get.back();

  }
}