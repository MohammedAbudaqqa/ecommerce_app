import 'package:ecommerce_audio/data/repository/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log out'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure to Log out.'),
              Text('Would you like to approve of this process?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              context.pushReplacement('/');
              AuthRepositoryImpl().logOut();
            },
          ),
          TextButton(
            child: const Text('Canacl'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
