import 'package:xuprememax/utils/utils.dart';

class BaseViewModel extends ValueNotifier<AppLoadingState> {
  BuildContext context = router.routerDelegate.navigatorKey.currentContext!;
  BaseViewModel() : super(AppLoadingState.normal);
}
