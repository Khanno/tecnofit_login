import 'package:flutter/material.dart';
import 'package:tecnofit_login/models/user_model.dart';

class CircleAvatarWidget extends StatelessWidget {
  final UserModel userDetails;
  final double? scale;

  CircleAvatarWidget({required this.userDetails, this.scale});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: userDetails.localAvatar == null ? Image.network(userDetails.avatar, scale: scale ?? 1.0,) : Image.memory(userDetails.localAvatar!, scale: scale ?? 2.5),
    );
  }
}
