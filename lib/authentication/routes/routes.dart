import 'package:flutter/material.dart';
import 'package:my_horse/authentication/bloc/app_bloc.dart';
import 'package:my_horse/authentication/screens/home_page.dart';
import 'package:my_horse/authentication/screens/login_page.dart';

List<Page> onGenerateAppViewPage(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
