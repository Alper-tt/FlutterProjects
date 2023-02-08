import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

class data with ChangeNotifier {
  List<LoginData> datas = [LoginData(name: "alper@gm.com", password: "123123")];
}
