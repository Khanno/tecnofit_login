import 'dart:typed_data';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final Uint8List? localAvatar;
  final String supportUrl;
  final String supportText;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.localAvatar,
    required this.supportUrl,
    required this.supportText,
  });

  UserModel.fromResponseMap(Map content) :
    id = content['data']['id'],
    email = content['data']['email'],
    firstName = content['data']['first_name'],
    lastName = content['data']['last_name'],
    avatar = content['data']['avatar'],
    localAvatar = null,
    supportUrl = content['support']['url'],
    supportText = content['support']['text'];
}