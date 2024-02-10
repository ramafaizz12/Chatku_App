import 'package:chat_app_firebase/features/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget onstatus() {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.sms_failed,
                  // color: Theme.of(context).snackBarTheme.actionTextColor,
                  color: Colors.grey.shade100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  state.message,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }
    },
    child: Container(),
  );
}
