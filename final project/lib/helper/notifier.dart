import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileUrlNotifier extends StateNotifier<String> {
  ProfileUrlNotifier() : super('');
  void setProfileUrl(String url) {
    state = url;
  }
}

final profileUrlProvider = StateNotifierProvider<ProfileUrlNotifier , String>((ref) {
  return ProfileUrlNotifier();
});


class UserNameNotifier extends StateNotifier<String> {
  UserNameNotifier() : super('');

  void setUserName(String url) {
    state = url;
  }
}

final UserNameProvider = StateNotifierProvider<UserNameNotifier , String>((ref) {
  return UserNameNotifier();
});