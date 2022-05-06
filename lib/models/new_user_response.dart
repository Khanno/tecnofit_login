class NewUserResponse {
  final int id;
  final String token;

  NewUserResponse({required this.id, required this.token});

  NewUserResponse.fromResponseMap(Map content) :
    id = content['id'],
    token = content['token'];
}