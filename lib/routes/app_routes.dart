part of 'app_pages.dart';

abstract class Routes {
  static const Route = _Paths.Route;
  static const HOME = _Paths.Home;
  static const Route2 = _Paths.Route2;
  static const Route3 = _Paths.Route3;
  static const PassWay1Screen = _Paths.PassWay1Screen;
  static const PassValueScreen = _Paths.PassValueScreen;
  static const PassWay2Screen = _Paths.PassWay2Screen;
  static const StateManageScreen = _Paths.StateManageScreen;

  static const BindingExScreen = _Paths.BindingExScreen;
}

abstract class _Paths {
  static const Home = '/home';
  static const Route = '/route';
  static const Route2 = '/route2';
  static const Route3 = '/route3';
  static const PassValueScreen = '/PassValueScreen';
  static const PassWay2Screen = '/PassWay2Screen';

  static const PassWay1Screen = '/PassWay1Screen';
  static const StateManageScreen = '/StateManageScreen';

  static const BindingExScreen = '/BindingExScreen';
}
