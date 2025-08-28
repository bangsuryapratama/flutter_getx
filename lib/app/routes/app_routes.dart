part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const COUNTER = _Paths.COUNTER;
  static const FORM_PENDAFTARAN = _Paths.FORM_PENDAFTARAN;
  static const POST = _Paths.POST;
  static const KITAB = _Paths.KITAB;
  static const AUTH = _Paths.AUTH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const COUNTER = '/counter';
  static const FORM_PENDAFTARAN = '/form-pendaftaran';
  static const POST = '/post';
  static const KITAB = '/kitab';
  static const AUTH = '/auth';
  static const LOGIN = '/auth/login';
  static const REGISTER = '/auth/register';
  static const PROFILE = '/profile';
}
