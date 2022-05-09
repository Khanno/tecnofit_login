import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/constants/drawer_items_list.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/models/user_model.dart';
import 'package:tecnofit_login/pages/dashboard/widgets/drawer_item_list_widget.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';
import 'package:tecnofit_login/widgets/avatars/circle_avatar_widget.dart';

class DashboardDrawerWidget extends StatelessWidget {
  final BoxConstraints constraints;

  DashboardDrawerWidget({required this.constraints});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, UserState state) {
          final UserModel userDetails = (state as ReadyUserState).user!;
          return SafeArea(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(drawerHorizontalMediaQueryHelper(context: context)),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatarWidget(userDetails: userDetails, scale: 2.5,)),
                        SizedBox(
                          width: drawerHorizontalMediaQueryHelper(context: context),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bem vindo(a) ${userDetails.firstName}!',
                                overflow: TextOverflow.ellipsis,
                                style: AppBarTextStyle(context: context).style()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.onSecondary,
                    thickness: 2.5,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: drawerItemList.length,
                    itemBuilder: (context, int index) {
                      return DrawerItemListWidget(
                        icon: drawerItemList[index].icon,
                        route: ModalRoute.of(context)!.settings.name == drawerItemList[index].route ? () {} : () => Navigator.pushNamed(context, drawerItemList[index].route),
                        text: drawerItemList[index].text,
                        constraints: constraints,
                      );
                    },
                  ),
                  const Spacer(),
                  DrawerItemListWidget(icon: Icon(Icons.logout), route: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false), text: 'Sair', constraints: constraints,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
