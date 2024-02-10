import 'package:chat_app_firebase/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app_firebase/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget onstatus() {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: red,
            content: Row(
              children: [
                const Icon(
                  Icons.sms_failed,
                  // color: Theme.of(context).snackBarTheme.actionTextColor,
                  color: putihh,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Gagal Login",
                  style: textpoppins,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }
      if (state is AuthSukses) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: birumuda,
            content: Row(
              children: [
                const Icon(
                  Icons.sms_failed,
                  // color: Theme.of(context).snackBarTheme.actionTextColor,
                  color: putihh,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Berhasil Login",
                  style: textpoppins,
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
