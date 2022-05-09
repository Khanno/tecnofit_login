import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tecnofit_login/bloc/user_bloc/user_bloc.dart';
import 'package:tecnofit_login/helper/media_query_helper.dart';
import 'package:tecnofit_login/models/user_model.dart';
import 'package:tecnofit_login/pages/dashboard/widgets/dashboard_drawer_widget.dart';
import 'package:tecnofit_login/pages/profile/bloc/profile_bloc.dart';
import 'package:tecnofit_login/pages/profile/widgets/profile_item_widget.dart';
import 'package:tecnofit_login/style/custom_text_styles.dart';
import 'package:tecnofit_login/widgets/app_bar/app_bar_widget.dart';
import 'package:tecnofit_login/widgets/avatars/circle_avatar_widget.dart';
import 'package:tecnofit_login/widgets/buttons/main_button_widget.dart';
import 'package:tecnofit_login/widgets/inputs/main_text_form_field.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Uint8List? _base64;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBarWidget(
            title: 'Perfil',
          ),
          drawer: DashboardDrawerWidget(constraints: constraints),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<UserBloc, UserState>(builder: (context, UserState state) {
                final UserModel userDetails = (state as ReadyUserState).user!;
                if (userDetails.firstName.isNotEmpty) {
                  _nameController.text = userDetails.firstName;
                }
                if (userDetails.lastName.isNotEmpty) {
                  _lastNameController.text = userDetails.lastName;
                }
                if (userDetails.email.isNotEmpty) {
                  _emailController.text = userDetails.email;
                }
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: mediaQueryHelper(context: context)),
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, ProfileState profileState) {
                      if (profileState.runtimeType == SavingProfileState) {
                        context
                            .read<UserBloc>()
                            .add(UpdateUserInformation(userData: (profileState as SavingProfileState).userData));
                      }
                    },
                    builder: (context, ProfileState profileState) {
                      switch (profileState.runtimeType) {
                        case EditingProfileState:
                          return Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 25),
                                SizedBox(
                                    height: 125,
                                    width: 125,
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final ImagePicker _picker = ImagePicker();
                                            final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
                                            if (file != null) {
                                              _base64 = await file.readAsBytes();
                                              context.read<ProfileBloc>().add(AddPhotoToStateEvent(base64: _base64!));
                                            }
                                          },
                                          child: (profileState as EditingProfileState).base64 == null
                                              ? CircleAvatarWidget(
                                                  userDetails: userDetails,
                                                )
                                              : ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.memory(_base64!),
                                                ),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary)),
                                      ],
                                    )),
                                const SizedBox(height: 15),
                                MainTextFormFieldWidget(
                                  controller: _nameController,
                                  isRequired: true,
                                  label: 'Nome',
                                  cursorColor: Theme.of(context).colorScheme.primary,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  labelStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                  textStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                ),
                                const SizedBox(height: 15),
                                MainTextFormFieldWidget(
                                  controller: _lastNameController,
                                  isRequired: true,
                                  label: 'Sobrenome',
                                  cursorColor: Theme.of(context).colorScheme.primary,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  labelStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                  textStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                ),
                                const SizedBox(height: 15),
                                MainTextFormFieldWidget(
                                  controller: _emailController,
                                  isRequired: true,
                                  textInputAction: TextInputAction.done,
                                  label: 'E-mail',
                                  cursorColor: Theme.of(context).colorScheme.primary,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
                                  labelStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                  textStyle: ProfilePageTextStyle(context: context)
                                      .style(color: Theme.of(context).colorScheme.primary),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    MainButtonWidget(
                                      text: 'Cancelar',
                                      onTap: () {
                                        if (userDetails.firstName.isNotEmpty) {
                                          _nameController.text = userDetails.firstName;
                                        }
                                        if (userDetails.lastName.isNotEmpty) {
                                          _lastNameController.text = userDetails.lastName;
                                        }
                                        if (userDetails.email.isNotEmpty) {
                                          _emailController.text = userDetails.email;
                                        }
                                        context.read<ProfileBloc>().add(CancelUpdateEvent());
                                      },
                                      width: kIsWeb
                                          ? mediaQueryHelper(context: context) / 1.5
                                          : MediaQuery.of(context).size.width * 0.35,
                                    ),
                                    const Spacer(),
                                    MainButtonWidget(
                                      text: 'Salvar',
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<ProfileBloc>().add(SaveNewProfileEvent(
                                                  userData: UserModel(
                                                avatar: state.user!.avatar,
                                                email: _emailController.text,
                                                firstName: _nameController.text,
                                                id: state.user!.id,
                                                lastName: _lastNameController.text,
                                                localAvatar: _base64,
                                                supportText: state.user!.supportText,
                                                supportUrl: state.user!.supportUrl,
                                              )));
                                        }
                                      },
                                      width: kIsWeb
                                          ? mediaQueryHelper(context: context) / 1.5
                                          : MediaQuery.of(context).size.width * 0.35,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        default:
                          return Column(
                            children: [
                              const SizedBox(height: 25),
                              Container(
                                width: 125,
                                height: 125,
                                child: CircleAvatarWidget(
                                  userDetails: userDetails,
                                ),
                              ),
                              ProfileItemWidget(
                                label: 'Nome: ',
                                content: userDetails.firstName,
                              ),
                              ProfileItemWidget(
                                label: 'Sobrenome: ',
                                content: userDetails.lastName,
                              ),
                              ProfileItemWidget(label: 'E-mail: ', content: userDetails.email),
                              const SizedBox(height: 25),
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  return MainButtonWidget(
                                    onTap: () => context.read<ProfileBloc>().add(EditProfileEvent()),
                                    text: 'Atualizar dados',
                                  );
                                },
                              )
                            ],
                          );
                      }
                    },
                  ),
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}
