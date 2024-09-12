import '../../data/repositories/user_data_sender.dart';

class SendUserDataUseCase {
  final UserDataSender _userDataSender;

  SendUserDataUseCase(this._userDataSender);

  Future<Map<String, dynamic>> call(String username, String email, String phone) async {
    return await _userDataSender.sendUserData(username, email, phone);
  }
}