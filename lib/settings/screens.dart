import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lgs_mobile_client/authentication/bloc/authentication.dart';
import 'package:lgs_mobile_client/authentication/controllers.dart';
import 'package:lgs_mobile_client/authentication/screens/_login_screens.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/shareable.dart';
import 'package:lgs_mobile_client/common/widgets.dart';
import 'package:lgs_mobile_client/settings/bloc/signout_cubit.dart';
import 'package:lgs_mobile_client/settings/bloc/signout_state.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  static const icon = Icons.settings;

  static const title = 'Setting';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  AuthenticationBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();

    final signoutCubit = SignoutCubit(
        authService: AuthService());

    return BlocListener<SignoutCubit, SignoutState>(
      listener: (context, SignoutState state) {
        if (state is SignoutError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: ${state.message}'),
          ));
        } else if (state == SignoutState.signoutRequested()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Signing out...'),
          ));
        } else if (state == SignoutState.signoutSuccess()) {
          authBloc.add(AuthenticationStateChanged(status: UnAuthenticatedState()));
        }
      },
      child: Center(
        child: Column(
          children: [
            Text('Settings Page'),
            BlocBuilder<SignoutCubit, SignoutState>(
                cubit: signoutCubit,
                builder: (context, state) {
                  return state.maybeWhen(
                    signoutRequested: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    orElse: () => appRaisedButton('Sign Out', () {
                      context.read<SignoutCubit>().signOut();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
